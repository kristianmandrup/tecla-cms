require 'rails_helper'

class WorkflowableModel < Cms::Document
  include_concerns :workflowable
end

describe Workflowable do
  pending 'todo'
end
