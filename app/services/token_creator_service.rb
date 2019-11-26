class TokenCreatorService

  def intialize(user, password)
    @user = user
    @password = password
  end

  def run
    if password_is_valid?
      tokenize_user_id
    end
  end

  private

  def password_is_valid?(password)
    user&.authenticate(params[:password])
  end

  def tokenize_user_id
    JsonWebToken.encode(user_id: user.id)
  end

end
