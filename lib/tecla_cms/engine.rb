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


    config.i18n.default_locale = :en
    config.time_zone = 'IST'
    config.i18n.load_path += Dir[config.root.join('locales', '*.{rb,yml}').to_s]
  end
end
