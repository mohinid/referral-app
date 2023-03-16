class Api::V1::RegistrationsController < Devise::RegistrationsController
    before_action :ensure_params_exist, only: :create
    skip_before_action :authenticate_user! , only: :create

    def create
      user = User.new user_params
      if user.save
        render json: {
          messages: "Sign Up Successful!"
        }, status: :ok
      else
        render json: {
          messages: "Sign Up Failed!"
        }, status: :unprocessable_entity
      end
    end
  
    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    def ensure_params_exist
      return if params[:user].present?
      render json: {
          messages: "Missing Params."
        }, status: :bad_request
    end
  end
