# TODO: This is NOT a concern. Move it out where it belongs!
class Translator
  extend ActiveSupport::Concern

  attr_accessor :base_lang, :translator_client

  def initialize translator_client
    @translator_client = translator_client
  end

  def translate(base_text)
    self.base_lang = translator_client.detect_language(base_text)
    translation_hash = { base_lang.to_sym =>  base_text}

    languages_for_traslation.each do |lang|
      translation_hash[lang] = @translator_client.translate(base_text, base_lang: base_lang, lang: lang)
    end
    translation_hash
  end

  def languages_for_traslation
    I18n.available_locales - [base_lang.to_sym]
  end
end
