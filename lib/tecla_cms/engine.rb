require 'dotenv'
require 'workflow'
require 'grape'
require 'devise' 
require 'cancancan'
require 'carrierwave'
require 'carrierwave/mongoid'
require 'rolify'
require 'mongoid-history'
require 'mongoid_orderable'
require 'mini_magick'

module TeclaCms
  class Engine < ::Rails::Engine
    isolate_namespace TeclaCms
    config.i18n.available_locales = [:de, :en]
    config.time_zone = 'IST'
    Dotenv.load
  end
end