Concerns
========

-	blueprintable
-	categorizable
-	commentable (TODO)
-	composite
-	content_item
-	describable
-	document
-	extendable
-	images
-	listable
-	localizable
-	metadata
-	named
-	publishable
-	renderable
-	serializable
-	taggable
-	templates
-	translatable
-	uniquely_named
-	uploadable
-	validatable
-	workflowable

### Blueprintable

Lets the model be a Blueprint for another model. The parent model is the `prototype` just like in JavaScript. Each model instance created form the prototype model is a `blueprint`. A prototype model can thus have many blueprints.

In the future we might set up blueprints to auto-reflect all or certain characteristics of the prototype

### Categorizable

Lets the model have `categories`. A category is simply a string, however for each type of model there should be a list of valid categories, and only certain (privileged) users should be allowed to add extra categories.

### Commentable (TODO)

Adds a method to return the comments for a model or retrieve comments by author. Comments should (likely) be stored in a Redis DB, keyed by the instance ID of the Mongo model instance.

### Composite

See: [Composite_pattern](https://en.wikipedia.org/wiki/Composite_pattern)

Makes the model into a Composite model. A Composite is a model which can be a child of another model. A composite that is part of a list should be `listable` (see Listable). Currently we assume that any Composite is part of a container which is a list.

### Document

Any Document will get these methods:

-	type
-	has_field?(name)

The `type` method which returns the type of model, which is the class name `demodulized` (See Rails `Inflector`).

The `has_field?(name)` method checks if the model has a field of the given name. This method is used in various meta-programming scenarios.

### Extendable

Makes the model extendable, which means that it can be enhanced with dynamic attributes as needed. Each dynamic attributes references a `GenericAttribute` by name. The GenericAttribute contains meta-information used when displaying and interacting with the attribute.

### Images

Lets the model have a list of `images`.

### Listable

Makes the model into an item that can be ordered with respect to its siblings. Listable ensure that the item has a position so that it can be ordered with respect to other list items (see Listable). Listable also includes

### Localizable

Makes the model localizable by adding the class methods:

-	`fields_localize`
-	`localize_fields(names)`

`fields_localize` can be called to localize current field by looking up their names.

`localize_fields` can be called with names of localized fields to be added to the model:

```ruby
  localize_fields :title, :description
```

### Metadata

Metadata will add the following metadata fields to the model:

-	description
-	tags
-	categories

It will also add class methods:

-	`metadata_field(name)`
-	`metadata_fields(hash)`

`metadata_field(name)` can be used to add a field to the list of metadata fields, for lookup.

`metadata_fields(fields)` you can use to easily add extra metadata fields by name (`String` type implied) and optionally with type using a `Hash`.

```ruby
  metadata_fields %w{ division author }
```

By hash:

```ruby
  metadata_fields keywords: Array, author: String
```

### Named

Lets the model have a `name`. The name is a required attribute and must follow some basic validation rules:

-	not empty
-	2-30 characters
-	alpha numeric (like a variable name)

### Publishable

Lets the model have a Workflow, used for rejection/approval and publishing. Adds a `status` field (published or unpublished.

Why do we have both a `state` and a `status`?

### Renderable

Lets the model be rendered. The model gets a `render` method which can be called like:

```ruby
model.render
model.render template: 'front-page'
model.render template: 'promotion', layout: 'mobile'
```

The rendering leverages the new Render Anywhere capabilities coming in Rails 5, which has been backported to Rails 4 via: [backport_new_renderer gem](https://github.com/brainopia/backport_new_renderer)

See [rails 5 render views outside of actions](https://medium.com/evil-martians/new-feature-in-rails-5-render-views-outside-of-actions-2fc1181e86a8)

### Serializable

Lets the model be serialized for use in JSON APIs, by adding a `to_json` method. The model must implement a method `my_api_attributes` that lists which attributes (fields) should be exposed to the serializer.

We might improve and simplify this in the (near) future similar to how localization is achieved, so that we have a default serialization config mechanism using a set of default fields.

### Taggable

Lets the model have `tags`. A tag is simply a string, however for each type of model there should be a list of valid tags, and only certain (privileged) users should be allowed to add extra tags.

### Templates

Lets the model have a set of `templates`. A model can be rendered using any of these templates. In the (near) future we will add Template Schemas and validate that the model fields fits the schema of a template before it can be added to the model.

### Translatable

Makes the model translatable by adding a method `translate_all` which can be used to translate all fields on save. A translator API must be used, such as Microsoft Translator (the current default). Currently the fields are translated in bulk mode, which is preferrable to minimize expensive API calls.

### Uniquely Named

Same as *Named*, but adds the extra constraint that the name must be unique within the scope of the model.

### Uploadable

Lets the model be uploaded via our Upload service, which currently uploads only to Amazon AWS. This concern is currently used in the `Cms::Image` model.

### Validatable

Adds smart validation to the model.

runtime validation is performed by the `Cms::Model::Validator`. A class method `fields_validation` is added and called, which sets up validation using conventions by field name, so that if a certain field name is found in the model, a set of validation rules are added. This makes it much easier to scale!

### Workflowable

Adds workflow to the model including a `state` field. The workflow is a state graph, triggered by certain events that result in state change.
