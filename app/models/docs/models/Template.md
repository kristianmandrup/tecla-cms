Templates
=========

A Template contains the `template` to render a given model. A template has a handler, such as `liquid` which relates to a template extension. Each template engine registered with Rails registers a template handler for the file extension it expects.

### Concerns

-	uniquely_named

A template must be uniquely named to not interfere with other templates.

### Relations

`belongs_to :templatable, polymorphic: :true`

Which means that any model with a polymorphic `templatable` relation can have one or more templates.

### Fields

-	type (`'layout'` or `'template'`\)
-	handler (default: `'liquid'`\)

By default this `handler` field is the `liquid` template handler.
