class ReferralsController < ApplicationController
  def new
    UserMailer.with(user: current_user).referral_email.deliver_later
  end
end
