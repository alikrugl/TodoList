# frozen_string_literal: true

class SignupController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      payload = { user_id: user.id, aud: [user.role] }
      session = JWTSessions::Session.new(payload:,
                                         refresh_by_access_allowed: true,
                                         namespace: "user_#{user.id}")
      tokens = session.login

      cookie_access_token(tokens[:access])
      render json: { csrf: tokens[:csrf] }
    else
      render json: { error: user.errors.full_messages.join('. ') },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
