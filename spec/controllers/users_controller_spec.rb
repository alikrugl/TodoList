# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #user_info' do
    let!(:user) { create(:user) }
    before(:each) { sign_in_as(user) }

    it 'returns a success response' do
      get :user_info
      expect(response).to be_successful
      expect(response_json).to eq user.as_json(only: %i[id email role])
    end
  end
end
