class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user_using_x_auth_token

  private
  def sign_in_params
    params.require(:user).permit :email, :token
  end

  def authenticate_user_using_x_auth_token
    user_email = request.headers["X-Auth-Email"]
    auth_token = request.headers["X-Auth-Token"]
    user = user_email && User.find_by(email: user_email)

    if user && auth_token && Devise.secure_compare(user.authentication_token, auth_token)
      sign_in user, store: false
        render json: { message: "Sign In Successful." }, status: :ok
    else
      render json: { message: "Sign Up Failed." }, status: :unauthorized
    end
  end
end
