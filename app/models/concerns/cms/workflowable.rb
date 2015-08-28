module Cms::Workflowable
  extend ActiveSupport::Concern

  included do

    include Workflow
    include Workflow::MongoidAdapter
    
    workflow_column :workflow
    
    workflow do
      state :new do
        event :submit, :transitions_to => :dev
      end
      state :dev do
        event :review, :transitions_to => :preview
      end
      state :preview do
        event :accept, :transitions_to => :publish
        event :reject, :transitions_to => :dev
      end
      state :publish
    end
  end
end
