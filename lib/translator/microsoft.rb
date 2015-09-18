# TODO: This is NOT a concern. Move it out where it belongs!
class Translator::Microsoft < Translator::Generic
  attr_reader :client

  def initialize
    @client = MicrosoftTranslator::Client.new client_id, secret
  end

  def secret
    ENV['TRANSLATOR_CLIENT_SECRET']
  end

  def client_id
    ENV['TRANSLATOR_CLIENT_ID']
  end

  def detect_language text
    client.detect(text)
  end

  def translate text, base_lang: 'en', mime: 'text/html', lang: nil
    throw 'Text translation missing language to translate to' unless lang
    client.translate(text, base_lang, lang, mime)
  end

end
