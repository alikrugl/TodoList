# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authorize_access_request!
    ROLES = %w[admin manager].freeze

    def index
      @users = User.all

      render json: @users.as_json(only: %i[id email role created_at])
    end

    def token_claims
      {
        aud: ROLES,
        verify_aud: true
      }
    end
  end
end