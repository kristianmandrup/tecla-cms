module Workflow
  module MongoidAdapter
    module InstanceMethods
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

    module ClassMethods
      # class methods of your adapter go here
    end

    def self.included(klass)
      klass.send :include, InstanceMethods
      klass.extend ClassMethods
    end
  end
end
