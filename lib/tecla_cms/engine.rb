require 'render_anywhere'
require 'liquid'
require 'microsoft_translator'
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
require 'carrierwave_backgrounder'

module TeclaCms
  class Engine < ::Rails::Engine
    isolate_namespace TeclaCms
    config.i18n.available_locales = [:en, :es, :fr, :de]
    config.time_zone = 'IST'
    Dotenv.load
  end
end
