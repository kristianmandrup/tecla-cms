# TODO: This is NOT a model. Move it!
class Template::Creator
  attr_reader :record

  extend Forwardable
  def_delegators :record, :path, :format, :name, :identifier, :body, :handler, :updated_at

  def initialize record, partial, details
    @record, @partial, @details = [record, partial, details]
  end

  # Initialize an ActionView::Template object based on the record found.
  def create
    ActionView::Template.new body, identifier, template_handler, template_details
  end

  def template_handler
    ActionView::Template.registered_template_handler handler
  end

  def template_details
    default_details.merge(details)
  end

  def default_details
    {
      :format => Mime[format],
      :updated_at => updated_at,
      :virtual_path => virtual_path(path, partial)
    }
  end

  # Make paths as "users/user" become "users/_user" for partials.
  def virtual_path
    return path unless partial
    index
  end

  def index
    path.rindex('/') ? path.insert(index + 1, '_') : "_#{path}"
  end
end

