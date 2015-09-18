List
====

A List is used to contain lists of items. A list can be a composite list, ie. a List can be an item in another list. Lists should be embedded, not referenced (for performance reasons).

A List is primarily designed to be used to model Menus, Nested menus, tabs etc. for use in an app. List items should have a label and optionally a link and an icon. List items should be localizable.

A list has a unique named so it can be accessed by name via API.

### Concerns

-	uniquely_named

### Relations

`has_many :list_items`

### Fields

NONE
