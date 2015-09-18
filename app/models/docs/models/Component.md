Component
=========

### Concerns

-	composite

### Relationships

Recursively embeds many components for a nested graph. We prefer embedding for performance and other reasons. Nested graphs should be "truly nested".

See [recursive embedding](http://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial/#recursive-embedding)

### Composite

See [Composite_pattern](https://en.wikipedia.org/wiki/Composite_pattern)

A Component can contain other components and act as a child component to form a nested component hierarchy . A component is thus a Composite used to compose nested graphs.
