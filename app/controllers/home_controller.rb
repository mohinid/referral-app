class HomeController < ApplicationController
  def index
    @referrals = User.where(referred_by_id: current_user.id)
    render
  end
end
