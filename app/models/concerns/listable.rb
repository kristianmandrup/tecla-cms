module Listable
  extend ActiveSupport::Concern

  included do
    include Mongoid::Orderable
    orderable
  end

end
