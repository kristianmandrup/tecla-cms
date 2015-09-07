class Cms::GenericAttribute
  include Mongoid::Document

  field :name, type: String
  field :caption, type: String
  field :type, type: String
  field :filters, type: String
  field :input, type: String
  field :output, type: String
  field :value, type: String
  
  belongs_to :generic, :polymorphic => true

end
