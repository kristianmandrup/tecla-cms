require 'workflow'
require 'grape'
require 'devise' 
require 'cancancan'
require 'carrierwave'
require 'carrierwave/mongoid'
require 'rolify'
require 'mongoid-history'
require 'mongoid_orderable'

module TeclaCms
  class Engine < ::Rails::Engine
    isolate_namespace TeclaCms
  end
end
