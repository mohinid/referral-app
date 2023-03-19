# Preview all emails at http://localhost:3000/rails/mailers/referral_mailer
class ReferralMailerPreview < ActionMailer::Preview
    def send_referral_email
        ReferralMailer.with(user: User.first, email: "test@test.com").referral_email.deliver_now
    end
end
