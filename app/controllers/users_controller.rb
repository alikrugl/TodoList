# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_access_request!

  def user_info
    render json: current_user.as_json(only: %i[id email role])
  end
end
