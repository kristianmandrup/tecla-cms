module Translatable
  extend ActiveSupport::Concern

  included do
    include_concerns :localizable
  end

  def translate_all
    fields_localized.each {|name| translate_field name }
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

