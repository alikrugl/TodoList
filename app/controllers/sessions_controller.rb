# frozen_string_literal: true

# It has two actions, login and logout. The login action authenticates a user and returns a JWT access token and a CSRF
# token. The logout action invalidates the JWT access token
class SessionsController < ApplicationController
  before_action :authorize_access_request!, only: [:logout]

  def login
    user = User.find_by!(email: params[:email])
    if user.authenticate(params[:password])
      set_session_expiration

      payload = { user_id: user.id, aud: [user.role] }
      session = JWTSessions::Session.new(payload:,
                                         refresh_by_access_allowed: true,
                                         namespace: "user_#{user.id}")
      tokens = session.login

      cookie_access_token(tokens[:access])
      render json: { csrf: tokens[:csrf] }
    else
      not_found
    end
  end

  def logout
    session = JWTSessions::Session.new(payload:, namespace: "user_#{payload['user_id']}")
    session.flush_by_access_payload
    render json: :ok
  end

  private

  def set_session_expiration
    JWTSessions.access_exp_time = 8.hours.to_i
    JWTSessions.refresh_exp_time = 1.week.to_i
  end

  def not_found
    render json: { error: 'Cannot find such email/password combination' }, status: :not_found
  end
end
