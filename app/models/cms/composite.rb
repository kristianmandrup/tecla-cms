# Abstract class
# TODO: throw error if instantiated directly!
class Cms::Composite < Cms::Document
  include_concerns :composite

  # IMPORTANT: This is key! A generic, polymorhic parent relationship!!
  # belongs_to :parent, as: :composable, polymorphic: true
end
