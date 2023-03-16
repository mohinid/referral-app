class ApplicationController < ActionController::Base
  acts_as_token_authentication_handler_for User, only: :create
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
end
