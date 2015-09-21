class ProtoTypeBuilder

  attr_reader :prototype

  def initialize prototype
    self.prototype = prototype
  end

  # transfer field values from prototype to target model
  # each name is a field or relation name (ie. attribute name)
  def build target
    attributes_to_transfer.each |name|
      target[name] = prototype[name]
    end
  end

  def attributes_to_transfer
    prototype.blueprint_attributes || prototype.fields.keys
  end
end
