module API
  module V1
    class MenuSerializer < BaseSerializer
      attributes :type, :name, :menus

      def menus
        {
          items: items,
          menus: sub_menus
        }
      end

      private
        def items
          ActiveModel::ArraySerializer.new(object.menu_items.items, {
            each_serializer: MenuItemSerializer, root: false
          })
        end

        def sub_menus
          object.menu_items.menus.inject({}) do |result, sub_menu|
            result[sub_menu.name] = self.class.new(sub_menu, root: false)
            result
          end
        end
    end
  end
end
