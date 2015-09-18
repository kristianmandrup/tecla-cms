List Item
=========

A List Item is contained inside a List. It is the *leaf* in a Composite model, with List as the Composite.

A list items can have a `label`, `link` and an `icon` (possibly even an `image`). At least one of these fields must have a valid value for the List item to be valid!

List items are be localizable on the label and link.

### Concerns

-	composite

### Relations

`belongs_to :list`

### Fields

A list item has the fields: `label`, `link` and `icon`, all strings.

```sh
localized_fields :label, :link
text_field :icon
```
