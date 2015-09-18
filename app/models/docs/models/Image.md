Image
=====

An Image is a content item with a title, the image itself (exposed as a url via upload). Each image can take part in one or more image lists and one or more blocks. To simplify, perhaps a block should just embed its own image list!

### Concerns

-	content_item
-	listable
-	templates
-	uploadable

### Relations

```sh
belongs_to :imageable (polymorphic)
belongs_to :image_list
belongs_to :named_image
```

An image can be contained (by reference) in an image list or be part of a named image. A named image is a key/value construct where the value is an image. A named image is a named composite and can thus be part of a component.

The imageable relationship is a generic/polymorphic relationship that any model can use.
