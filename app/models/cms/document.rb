class Cms::Document
  # include Concerned
  # include_concerns :document #, :listable
  include Mongoid::Document
  include Mongoid::Orderable
  include Named
  # orderable

end