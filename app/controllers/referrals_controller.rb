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
    
    # rescue failed email
    begin
      ReferralMailer.with(user: current_user, email: params[:email]).referral_email.deliver_now
      true
    rescue StandardError => e
      logger.error "Error sending referral email: #{e.message}"
      flash[:alert] = "Failed to send referral email, please try again later."
      false
    end
  end
end
