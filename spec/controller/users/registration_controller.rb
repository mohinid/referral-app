require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do
  describe '#new' do
    context 'when referral_code is present and referrer exists' do
      let(:referrer) { create(:user) }
      before { get :new, params: { referral_code: referrer.referral_code } }

      it 'sets referred_by_id to referrer id' do
        expect(assigns(:referred_by_id)).to eq referrer.id
      end

      it 'renders the new template' do
        expect(response).to render_template :new
      end
    end

    context 'when referral_code is not present or referrer does not exist' do
      before { get :new }

      it 'does not set referred_by_id' do
        expect(assigns(:referred_by_id)).to be_nil
      end

      it 'renders the new template' do
        expect(response).to render_template :new
      end
    end
  end
end
