class Cms::Template
  include Mongoid::Document
  
  field :name, type: String, localize: true
  field :content, type: String, localize: true
  field :format, type: String, default: 'html'
  
  belongs_to :templatable, polymorphic: :true
  
  # path is just a specific kind of name really
  alias_method :path, :name

  def identifier
    "#{record.type} - #{record.id} - #{record.path}"
  end
end
