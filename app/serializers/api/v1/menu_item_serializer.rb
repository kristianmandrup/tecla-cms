module API
  module V1
    class MenuItemSerializer < BaseSerializer
      attributes :icon, :link, :label, :type
    end
  end
end
