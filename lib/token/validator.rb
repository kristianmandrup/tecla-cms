require 'jwt'
class Token::Validator
  def initialize(token)
    @token = token
    unless decoded_data
      raise('Failed to initialize. Invalid token!')
      @token = nil
    end
  end

  def valid_jwt_token?
    user_identifier == token_identifier
  end

  def user_identifier
    user.email
  end

  def token_identifier
    decoded_data.first[user_id.to_s]
  end

  def user
    @user ||= User.find(user_id)
  end

  def user_id
    @user_id ||= decoded_data.first.keys.first
  end

  def decoded_data
    JWT.decode(@token, nil, false) rescue nil
  end
end
