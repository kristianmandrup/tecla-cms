Menu
====

A Menu is used to contain lists of items. A list can be a composite list, ie. a List can be an item in another list. Lists should be embedded, not referenced (for performance reasons).

A Menu is primarily designed can be used stand-alone for a top menu, tabs, accordion etc. or used to build Nested menus via Composition. A Menu must embed its menu items for better performance. We expect that menu items will rarely be re-used across menus. Menu items should have a label and optionally a link and an icon. Menu items should be localizable.

A menu is uniquely named so it can be accessed by name via API.

### Concerns

-	uniquely_named

### Relations

`has_many :menu_items``embeds_one :image`

### Fields

-	label
-	icon
-	link
