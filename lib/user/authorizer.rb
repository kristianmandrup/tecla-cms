class User::Authorizer
  attr_reader :email, :password

  def initialize email, password
    @email, @password = [email, password]
  end

  def authorize
    valid_auth? ? Token::Responder.new(user).valid_token : Token::Responder.new(user).invalid_token
  end

  def user
    @user
  end

  def valid_auth?
    @user = User.authenticate(email, password)
    user.present?
  end

end
