require 'rails_helper'

RSpec.describe ReferralMailer, type: :mailer do
  describe 'referral_email' do
    let(:user) { create(:user) }
    let(:email) { Faker::Internet.email }
    let(:mail) { ReferralMailer.with(user: user, email: email).referral_email }

    it 'renders the subject' do
      expect(mail.subject).to eq('Welcome to DirectShifts App!')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['noreply@directshifts.com'])
    end

    it 'assigns @user' do
      expect(mail.body.encoded).to match(email)
      expect(mail.body.encoded).to match(user.referral_code)
    end

    it 'assigns @url' do
      expect(mail.body.encoded).to include("http://localhost:3000/users/sign_up?referral_code=#{user.referral_code}")
    end
  end
end
