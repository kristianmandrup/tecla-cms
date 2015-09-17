# TODO: merge with Layout model
class Cms::Template
  include Mongoid::Document
  include Named

  field :content, type: String, localize: true
  field :format, type: String, default: 'html'
  field :type, type: String, default: 'template'

  field :handler,     type: String, :default => 'liquid'
  field :tags,        type: Array
  field :template,    type: String
  field :categories,  type: Array
  field :description, type: String

  # TODO: validate either 'template' or 'layout'
  validates :type, presence: true

  belongs_to :templatable, polymorphic: :true

  # path is just a specific kind of name really
  alias_method :path, :name

  def identifier
    "#{record.type} - #{record.id} - #{record.path}"
  end
end
