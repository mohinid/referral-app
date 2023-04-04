require "rails_helper"

RSpec.describe Api::V1::RegistrationsController, type: :controller do
    before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
    end
   describe '#create' do
    context 'when registration is successful' do
      let(:params) do
        {
          user: {
            email: 'test@example.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      end

      before { post :create, params: params }

      it 'returns a 201 status code' do
        expect(response).to have_http_status(201)
      end

      it 'returns a success message' do
        expect(json_response['user']['email']).to eq('test@example.com')
        expect(json_response['message']).to eq('Sign Up Successful.')
        expect(json_response).to have_key('user')
        expect(json_response['user']['email']).to eq('test@example.com')
      end
    end

    context 'when registration fails' do
      let(:params) do
        {
          user: {
            email: 'test@example.com',
            password: 'password',
            password_confirmation: 'not_matching'
          }
        }
      end

      before { post :create, params: params }

      it 'returns a 422 status code' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(JSON.parse(response.body)).to include('message' => 'Sign Up Failed')
      end
    end
  end
end
