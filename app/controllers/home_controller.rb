class HomeController < ApplicationController
  def index
    @referrals = current_user.referrals
    @referred_subscribers = User.where(referred_by: current_user)
    render
  end
end
