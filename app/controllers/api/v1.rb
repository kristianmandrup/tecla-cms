module API
  module V1
    singleton_class.send :attr_accessor, :token_header_name
    self.token_header_name = 'Token'

    singleton_class.send :attr_accessor, :local_param_name
    self.local_param_name = :locale
  end
end
