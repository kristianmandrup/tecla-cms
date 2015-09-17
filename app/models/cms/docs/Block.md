Block
=====

A *Block* is the main atomic content building block.

### Prototype

The block can act as a prototype and define the blueprint for other blocks to be built from. A block built from a prototype links to the prototype via the special `prototype` relation. A prototype block can have one or more blueprints, each accessed via the `blueprints` relation.

### Localization

A Block contains the following *localized fields*

-	title
-	summary
-	content

### Images

A block can have references to one or more images via the `images` relationship.

### Generic attributes

A Block can reference one or more Generic attributes via `generic_attributes`. Each such attribute contains information on how to handle that field, such as display rules, validation etc. Generic attributes allow the client to add whichever extra data or metadata they need to a Model. This is often used to enter metadata, such as SEO or tracking data etc. Generic attributes are designed to play nicely with UIs and form builders.

### Lists

A Block can be part of one or more Block lists via the `block_lists` relationship.

### Templates

A Block can reference one or more Templates via the `templates` relationship. This allows a block to be rendered or previewed via any of these templates. By using a prototype builder, we can ensure all blocks from the same prototype share and use the same templates!

### Named blocks and Components

A Block can be referenced by a Named block via the `named_block` relationship. A Named block can act as an entry in a Component which is a container for key/values, similar to a Hash (or Object).

TODO: In fact, a block can be referenced by differently named named blocks, so it should be a `has_and_belongs_to_many` relationship!

### Validations

A Block must have a `title` and `content` to be valid. We don't want to render a block without basic content.
