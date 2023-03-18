class ReferralMailer < ApplicationMailer
    def referral_email
        @user = params[:user]
        @email = params[:email]
        @url  = "http://localhost:3000/users/sign_up?referral_code=#{@user.referral_code}"
        mail(to: @email, subject: 'Welcome to DirectShifts App!')
    end
end
