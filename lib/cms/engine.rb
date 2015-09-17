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
require 'concerned'

module Cms

  # http://stackoverflow.com/questions/19098663/auto-loading-lib-files-in-rails-4
  # auto-load lib files
  # alternative: Rails.root.join('lib')
  class Engine < ::Rails::Engine
    isolate_namespace Cms
    config.autoload_paths << "#{config.root}/lib"
    config.i18n.available_locales = [:en, :es, :fr, :de]
    config.time_zone = 'IST'
    Dotenv.load
  end
end
