class ReferralsController < ApplicationController
  def create
   if !(duplicate_email)
      ReferralMailer.with(user: current_user, email: params[:email]).referral_email.deliver_now
      @referral = current_user.referrals.new(email: params[:email])
      flash.keep[:notice] = "Email to '#{params[:email]}' sent and saved for reference!" if @referral.save 
   end
    redirect_to root_path
  end

  private
    def duplicate_email 
      if Referral.find_by(email: params[:email]) || User.find_by(email: params[:email])
        flash.keep[:alert] = "Email '#{params[:email]}' already exists as a referred user or subscriber. Please use another email."
      end
    end
end
