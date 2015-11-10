# Use this hook to configure json token authentication.
JsonTokenAuthentication.configure do |config|
  # ==> Entity Class Name
  # This options will let authentication mechanism to aware about the class
  # of the entity. Defaults to +User+.
  config.entity_class_name = 'Cms::User'

  # ==> Entity Identifier Method Name
  # This key will be used for to decode and encode value of the entity.
  # Defaults to +email+.
  # config.entity_identifier_method_name = 'email'

  # ==> Configuration for expiration
  # This option can be used to set the expiry of token. Defaults to +24.hours+
  # config.expiry_within = 24.hours

  # ==> Configurations for Encoder
  #
  # ==> Secret
  # This option is to use secret for encoding the token.
  # Defaults to +secret+.
  # config.encoder_secret = 'secret'
  #
  # ==> Encoder
  # This option will let you to select you custom encoder.
  # Defaults to +JWT+
  # config.encoder = JWT
end
