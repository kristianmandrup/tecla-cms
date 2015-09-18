require 'spec_helper'

class WorkflowableModel < Cms::Document
  incluede_concerns :workflowable
end

describe Workflowable do
  pending 'todo'
end