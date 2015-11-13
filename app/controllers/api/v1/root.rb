module API
  module V1
    extend ActiveSupport::Autoload

    autoload_under 'concerns' do
      autoload :DefaultOptions
      autoload :DefaultResources
      autoload :DefaultHelpers
    end

    class Root < Grape::API
      helpers(DefaultHelpers)
      before { set_locale }

      mount API::V1::Blocks
      mount API::V1::Images
      mount API::V1::MenuItems
      mount API::V1::Menus
      mount API::V1::Lists
      mount API::V1::Layouts
      mount API::V1::Pages
      mount API::V1::Users
    end
  end
end
