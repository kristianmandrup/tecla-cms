class Cms::Page
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :lists,   class_name: "Cms::List"
  has_many :objects, class_name: "Cms::HashList"
  has_many :blocks,  class_name: "Cms::BlockList"
  has_many :images,  class_name: "Cms::ImageList"

  field :name,   type: String
  
  def nested_item
    hash = {} 
    hash["lists"] = []
    hash["blocks"] = []
    hash["objects"] = []
    hash["images"] =[]

    lists.each do |l|
      hash["lists"] << l.as_json(only: [:name])  
    end
    blocks.each do |b|
      hash["blocks"] << b.as_json(only: [:name])  
    end
    objects.each do |o|
      hash["objects"] << o.as_json(only: [:name])  
    end
    images.each do |i|
      hash["images"] << i.as_json(only: [:name])  
    end
    hash
  end
end
