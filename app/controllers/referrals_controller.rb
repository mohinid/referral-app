class ReferralsController < ApplicationController
  def create
    if send_mail
      @referral = current_user.referrals.create(email: params[:email])
      flash.keep[:notice] = "Email to '#{params[:email]}' sent and saved for reference!" 
    end 
    redirect_to root_path
  end

  private
  def duplicate_email?
    Referral.exists?(email: params[:email]) || User.exists?(email: params[:email])
  end

  def send_mail
    if duplicate_email?
      flash[:alert] = "Email '#{params[:email]}' already exists as a referred user or subscriber. Please use another email."
      return false
    end

    ReferralMailer.with(user: current_user, email: params[:email]).referral_email.deliver_now
    true
  end
end
