class Cms::MicrosoftTranslator < Cms::GenericTranslator
  attr_reader :client

  def initialize
    @client = MicrosoftTranslator::Client.new(ENV['TRANSLATOR_CLIENT_ID'], ENV['TRANSLATOR_CLIENT_SECRET']) 
  end

  def detect_language text
    client.detect(text)
  end

  def translate text, base_lang: 'en', mime: 'text/html', lang: nil
    throw 'Text translation missing language to translate to' unless lang
    client.translate(text, base_lang, lang, mime)
  end
  
end
