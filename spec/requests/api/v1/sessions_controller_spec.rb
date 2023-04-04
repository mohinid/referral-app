require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
    before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
    end
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:valid_params) { { user: { email: user.email, token: user.authentication_token } } }

    context 'with valid X-Auth headers' do
      before do
        request.headers['X-Auth-Email'] = user.email
        request.headers['X-Auth-Token'] = user.authentication_token
        post :create, params: valid_params
      end

      it 'signs in the user' do
        expect(subject.current_user).to eq(user)
      end

      it 'returns a success response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a success message' do
        expect(json_response['message']).to include('Sign In Successful.')
      end
    end

    context 'with invalid X-Auth headers' do
      before do
        request.headers['X-Auth-Email'] = 'invalid_email@example.com'
        request.headers['X-Auth-Token'] = 'invalid_token'
        post :create, params: valid_params
      end

      it 'does not sign in the user' do
        expect(subject.current_user).to be_nil
      end
    end
end
end
