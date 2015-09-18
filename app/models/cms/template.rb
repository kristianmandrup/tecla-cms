# TODO: merge with Layout model
class Cms::Template < Cms::Document
  include_concerns :uniquely_named

  text_field :format, default: 'html'
  # can also be 'layout'
  text_field :type, default: 'template'

  # uses the template handler registered by this extension
  text_field :handler, :default => 'liquid'

  # the actual template content
  text_field :template

  # TODO: validate either 'template' or 'layout'
  validates :type, presence: true
  validates_inclusion_of :type, :in => %w(template layout)

  belongs_to :templatable, polymorphic: :true

  # path is just a specific kind of name really
  alias_method :path, :name

  # used for virtual path by template resolve
  # virtual path is used for template caching:
  # ie. the same virtual path + content to be rendered...
  # --> will deliver cached template result
  def identifier
    "#{record.type} - #{record.id} - #{record.path}"
  end
end
