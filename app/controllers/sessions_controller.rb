# frozen_string_literal: true

# It has two actions, login and logout. The login action authenticates a user and returns a JWT access token and a CSRF
# token. The logout action invalidates the JWT access token
class SessionsController < ApplicationController
  before_action :authorize_access_request!, only: [:logout]

  def login
    user = User.find_by!(email: params[:email])
    if user.authenticate(params[:password])
      JWTSessions.access_exp_time = 8.hours.to_i
      JWTSessions.refresh_exp_time = 1.week.to_i

      payload = { user_id: user.id, aud: [user.role] }
      session = JWTSessions::Session.new(payload:, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      not_authorized
    end
  end

  def logout
    session = JWTSessions::Session.new(payload:)
    session.flush_by_access_payload
    render json: :ok
  end

  private

  def not_found
    render json: { error: 'Cannot find such email/password combination' }, status: :not_found
  end
end
