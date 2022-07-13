# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SignupController, type: :controller do
  describe 'POST #create' do
    let(:password) { FFaker::Internet.password }
    let(:user_params) { { email: FFaker::Internet.email, password:, password_confirmation: password } }

    it 'returns http success and create new user' do
      expect do
        post :create, params: user_params
      end.to change(User, :count).by(1)

      expect(response).to have_http_status(:success)
      expect(response_json.keys).to eq ['csrf']
      expect(response.cookies[JWTSessions.access_cookie]).to be_present
    end
  end
end
