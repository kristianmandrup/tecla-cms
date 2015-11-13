module API
  module V1
    module DefaultResources
      extend ActiveSupport::Concern

      module ClassMethods
        def resources_for(resource_name = nil, serializer: nil, model_klass: nil)
          resource_name ||= name.demodulize.underscore.to_sym
          resources resource_name do
            yield if block_given?
            InheritiableResources.new(self, serializer, model_klass).load!
          end
        end
      end

      class InheritiableResources
        extend Forwardable

        attr_reader :api
        def initialize(api, serializer, model_klass)
          @api = api
          @serializer = serializer
          @model_klass = model_klass
        end

        def load!
          create_helpers
          create_resources
        end

        private
          def create_resources
            serializer = @serializer
            api.get(({ each_serializer: serializer, root: false }).compact) do
              find_list
            end

            api.post do
              authenticate!
              authorize_resource!(:create)
              object = api.model_klass.new(permitted_params)
              if object.save
                { status: 201, message: 'created successfully' }
              else
                { status: 422, errors: object.errors }
              end
            end

            api.params do
              requires :id, type: String
            end

            api.route_param :id do
              before { load_resource! }

              get({ serializer: serializer, root: false }.compact) do
                @resource
              end

              put do
                update_resource
              end

              patch do
                update_resource
              end

              post do
                update_resource
              end

              delete do
                authenticate!
                authorize_resource!(:destroy)
                if @resource.destroy
                  { status: 200, message: 'deleted successfully' }
                else
                  { status: 422, errors: @resource.errors }
                end
              end
            end
          end

          def create_helpers
            _model_klass = @model_klass
            api.helpers do
              class_eval <<-EOS
                private
                  def model_klass
                    #{ _model_klass }
                  end
              EOS

              private
                def load_resource!
                  @resource = model_klass.find_by(id: params[:id])
                  unless @resource
                    error!({ message: 'Not Found' }, 404)
                  end
                end

                def authorize_resource!(action)
                  if current_ability.cannot? action, model_klass
                    error!({ message: 'Unauthorized' }, 401)
                  end
                end

                def update_resource
                  authenticate!
                  authorize_resource!(:update)
                  if @resource.update(permitted_params)
                    { status: 200, message: 'updated successfully' }
                  else
                    { status: 422, errors: @resource.errors }
                  end
                end

                def find_list
                  if defined?(super)
                    super
                  else
                    model_klass.all
                  end
                end

                def permitted_params
                  if defined?(super)
                    super
                  else
                    raise NotImplementedError.new('controller must impletement this behaviour')
                  end
                end
            end
          end
      end
    end
  end
end
