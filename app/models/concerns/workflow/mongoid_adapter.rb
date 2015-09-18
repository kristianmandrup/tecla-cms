module Workflow
  module MongoidAdapter
    extend ActiveSupport::Concern

    included do
      def load_workflow_state
        # Load and return the workflow_state from some storage.
        # You can use self.class.workflow_column configuration.
       read_attribute(self.class.workflow_column)
      end

      def persist_workflow_state(new_value)
        # save the new_value workflow state
       write_attribute(self.class.workflow_column, new_value)
      end
    end

    class_methods do
      #  of your adapter go here
    end
  end
end
