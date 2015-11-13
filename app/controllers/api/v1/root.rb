require_dependency File.expand_path('concerns/default_options', __dir__)
require_dependency File.expand_path('concerns/default_resources', __dir__)
require_dependency File.expand_path('concerns/default_helpers', __dir__)

module API
  module V1
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
