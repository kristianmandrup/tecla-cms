module Translatable
  extend ActiveSupport::Concern

  included do
    # include Localizable
  end

  def localized_fields
    [:title, :description]
  end

  def translate_all
    localized_fields.each {|name| translate_field name }
    save!
  end

  def translate_field name
    send("#{name}_translations=", translate(name)
  end

  def translate field_name
    value = send field_name
    translator.translate(value) unless value.blank?
  end

  def translator
    @translator ||= Cms::Translator.new(Cms::MicrosoftTranslator.new)
  end
end

