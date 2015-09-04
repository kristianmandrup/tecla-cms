class PublishJob < ActiveJob::Base
  queue_as :publishing

  def perform(object_id)
    block = Cms::Block.find(object_id)
    block.accept!
    block.save!
  end
end
