class ReferralsController < ApplicationController

  def new
    render
  end

  def create
    ReferralMailer.with(user: current_user, email: params[:email]).referral_email.deliver_now
    redirect_to root_path
    flash[:success] = "Email sent successfully"
  end
end
