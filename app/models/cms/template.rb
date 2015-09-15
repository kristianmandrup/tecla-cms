class Cms::Template
  include Mongoid::Document
  
  field :name, type: String, localize: true
  field :content, type: String, localize: true
  
  belongs_to :templatable, polymorphic: :true
end
