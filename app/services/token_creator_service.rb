class TokenCreatorService

  HMAC_SECRET = 'someawesomesecretkey'

  attr_accessor :user, :password

  def initialize(user, password)
    @user = user
    @password = password
  end

  def run
    if password_is_valid?
      tokenize_user_id
    end
  end

  private

  def password_is_valid?
    user&.authenticate(password)
  end

  def tokenize_user_id
    JWT.encode({user_id: user.id}, HMAC_SECRET, 'HS256')
  end

end
