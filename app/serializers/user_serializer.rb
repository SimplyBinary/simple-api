class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email
  attribute :token do |user, params|
  	params[:token]
  end
end
