class HomeController < ApplicationController
  def index
    @referrals = current_user.referrals
    @referred_subscribers = User.where(referred_by_id: current_user.id)
    render
  end
end
