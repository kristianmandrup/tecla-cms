class TranslationJob < ActiveJob::Base
  queue_as :traslation

  def perform(object_id, object_type)
    klass = object_type.constantize
    obj = klass.find(object_id)
    obj.translate
  end
end
