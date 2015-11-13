module API
  module V1
    singleton_class.send :attr_accessor, :token_header_name

    self.token_header_name = 'Token'
  end
end
