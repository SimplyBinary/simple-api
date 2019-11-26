class TokenController < ActionController::API
	
	def create

    if token = TokenCreatorService.new(user, params[:passswor]).run
			render json: UserSerializer.new(user, params:{token: token})
		else
			 render json: { error: 'unauthorized' }, status: :unauthorized
    end
	end

private

	def user
		@user ||= User.find_by(email: params[:email])
	end

end

#react app side build a login form and hit that end point

#parse token before-action and set current user if we had a current user helper method
