# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:user_params) { { email: user.email, password: user.password } }

    it 'returns http success' do
      post :login, params: user_params
      expect(response).to have_http_status(:success)
      expect(response_json.keys).to eq ['csrf']
      expect(response.cookies[JWTSessions.access_cookie]).to be_present
    end

    it 'returns unauthorized for invalid params' do
      post :login, params: { email: user.email, password: 'incorrect' }
      expect(response).to have_http_status(401)
    end
  end
end
