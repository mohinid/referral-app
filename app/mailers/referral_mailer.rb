class UserMailer < ApplicationMailer
    def referral_email
        @user = params[:user]
        @email = params[:email]
        @url  = "http://localhost:3000/users/sign_up?referred_by=#{@user.id}"
        mail(to: @email, subject: 'Welcome to DirectShifts App!')
    end
end
