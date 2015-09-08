class Cms::Page
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :lists,   class_name: 'Cms::List'
  has_many :objects, class_name: 'Cms::HashList'
  has_many :blocks,  class_name: 'Cms::BlockList'
  has_many :images,  class_name: 'Cms::ImageList'

  field :name,   type: String

  def nested_item
    collections.inject({}) do |res, name|
      res[name] ||= []
      send(name).each do |model|
        res[name] << model.as_json(only: [:name])
      end
      res
    end
  end

  private

  def collections
    ['lists', 'blocks', 'objects', 'images']
  end
end
