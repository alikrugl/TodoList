# frozen_string_literal: true

module Admin
  module Users
    class TodosController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_user
      ROLES = %w[admin].freeze

      def index
        render json: @user.todos
      end

      def token_claims
        {
          aud: ROLES,
          verify_aud: true
        }
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
