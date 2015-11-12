require 'render_anywhere'
require 'liquid'
require 'grape'
require 'devise'
require 'cancancan'
require 'rolify'
require 'concerned'
require 'cms-models'
require 'json_token_authentication'

module Cms

  # http://stackoverflow.com/questions/19098663/auto-loading-lib-files-in-rails-4
  # auto-load lib files
  # alternative: Rails.root.join('lib')
  class Engine < ::Rails::Engine
    isolate_namespace Cms
    config.autoload_paths << config.root.join('lib')
    config.i18n.available_locales = [:en, :es, :fr, :de]
    config.time_zone = 'IST'
    Dotenv.load
  end
end


