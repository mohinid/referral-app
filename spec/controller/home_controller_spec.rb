require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }
      let(:referral1) { create(:referral, user: user) }
      let(:referral2) { create(:referral, user: user) }
      let(:referred_user1) { create(:user, referred_by: user) }
      let(:referred_user2) { create(:user, referred_by: user) }

      before do
        sign_in user
        get :index
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'assigns @referrals to the user\'s referrals' do
        expect(assigns(:referrals)).to match_array([referral1, referral2])
      end

      it 'assigns @referred_subscribers to the users referred by the current user' do
        expect(assigns(:referred_subscribers)).to match_array([referred_user1, referred_user2])
      end
    end

    context 'when user is not authenticated' do
      before { get :index }

      it 'redirects to the sign in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
