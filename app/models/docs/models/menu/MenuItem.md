Menu Item
=========

A Menu Item is contained (embedded) inside a Menu. It is the *leaf* in a Composite model, with Menu as the Composite container.

A menu item can have a `label`, `link` and an `icon` (possibly even an `image`). At least one of these fields must have a valid value for the Menu item to be valid. The menu item can not be completely empty!

Menu items are be localizable on the label and link.

### Concerns

-	composite

### Relations

`embedded_in :list`

### Fields

A menu item has the fields: `label`, `link` and `icon`, all strings.

```sh
localized_fields :label, :link
text_field :icon
```
