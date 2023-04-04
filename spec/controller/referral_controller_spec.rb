require 'rails_helper'

RSpec.describe ReferralsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }

    context 'when referral email is unique' do
      before do
        sign_in user
        allow(ReferralMailer).to receive_message_chain(:with, :referral_email, :deliver_now)
        post :create, params: { email: Faker::Internet.email }
      end

      it 'sends a referral email' do
        expect(ReferralMailer).to have_received(:with)
      end

      it 'creates a new referral' do
        expect(user.referrals.count).to eq(1)
      end

      it 'redirects to root path' do
        expect(response).to redirect_to(root_path)
      end

      it 'sets the flash notice' do
        expect(flash[:notice]).to be_present
      end
    end

    context 'when referral email is a duplicate' do
      before do
        sign_in user
        create(:user, email: 'test@example.com')
        create(:referral, email: 'test@example.com')
        post :create, params: { email: 'test@example.com' }
      end

      it 'does not create a new referral' do
        expect(user.referrals.count).to eq(0)
      end

      it 'redirects to root path' do
        expect(response).to redirect_to(root_path)
      end

      it 'sets the flash notice' do
        expect(flash[:notice]).to be_present
      end
    end
  end
end
