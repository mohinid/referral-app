require 'rails_helper'

RSpec.describe ReferralsController, type: :controller do
  describe "POST #create" do
    let(:user) { create(:user) }
    let(:valid_params) { { email: "test@example.com" } }

    context "when email is sent successfully" do
      before do
        allow(ReferralMailer).to receive_message_chain(:with, :referral_email, :deliver_now)
        sign_in user
        post :create, params: valid_params
      end

      it "creates a new referral" do
        expect(user.referrals.count).to eq(1)
        expect(user.referrals.first.email).to eq(valid_params[:email])
      end

      it "sets the flash notice message" do
        expect(flash[:notice]).to eq("Email to '#{valid_params[:email]}' sent and saved for reference!")
      end

      it "redirects to root path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when email sending fails" do
      before do
        allow(ReferralMailer).to receive_message_chain(:with, :referral_email).and_raise(StandardError.new("email sending failed"))
        sign_in user
        post :create, params: valid_params
      end

      it "does not create a new referral" do
        expect(user.referrals.count).to eq(0)
      end

      it "sets the flash alert message" do
        expect(flash[:alert]).to eq("Failed to send referral email, please try again later.")
      end

      it "redirects to root path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when email is a duplicate" do
      before do
        create(:referral, email: valid_params[:email])
        sign_in user
        post :create, params: valid_params
      end

      it "does not create a new referral" do
        expect(user.referrals.count).to eq(0)
      end

      it "sets the flash alert message" do
        expect(flash[:alert]).to eq("Email '#{valid_params[:email]}' already exists as a referred user or subscriber. Please use another email.")
      end

      it "redirects to root path" do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
