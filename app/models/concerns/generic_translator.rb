# TODO: This is NOT a concern. Move it out where it belongs!
class GenericTranslator
  def detect_language text
    raise NotImplementedError.new("GenericTranslator subclass must implement: detect_language")
  end

  def translate text, base_lang: 'en', mime: 'text/html', lang: nil
    raise NotImplementedError.new("GenericTranslator subclass must implement: translate")
  end
end
