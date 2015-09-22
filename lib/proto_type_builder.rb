class ProtoTypeBuilder

  attr_accessor :prototype

  def initialize prototype
    @prototype = prototype
  end

  # transfer field values from prototype to target model
  # each name is a field or relation name (ie. attribute name)
  def build target
    attributes_to_transfer.each do |name|
      target[name] = prototype[name]
    end
  end

  def attributes_to_transfer
    return prototype.blueprint_attributes if prototype.blueprint_attributes.present?
    prototype.fields.keys - ['_id']
  end
end
