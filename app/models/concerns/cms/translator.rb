class Cms::Translator
  extend ActiveSupport::Concern
  
  attr_accessor :base_lang
  
  def initialize
    @translator_client = MicrosoftTranslator::Client.new(ENV['TRANSLATOR_CLIENT_ID'], ENV['TRANSLATOR_CLIENT_SECRET'])
  end
  
  def translate(base_text)
    self.base_lang = @translator_client.detect(base_text)
    translation_hash = { base_lang.to_sym =>  base_text}
    languages_for_traslation.each do |lang|
      translation_hash[lang] = @translator_client.translate(base_text, base_lang, lang, "text/html")
    end
    translation_hash
  end
  
  def languages_for_traslation
    I18n.available_locales - [base_lang.to_sym]
  end
  
end
