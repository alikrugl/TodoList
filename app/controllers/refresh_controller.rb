# frozen_string_literal: true

class RefreshController < ApplicationController
  before_action :authorize_refresh_by_access_request!

  def create
    session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true,
                                       namespace: "user_#{claimless_payload['user_id']}")
    tokens = session.refresh_by_access_payload do
      raise JWTSessions::Errors::Unauthorized, 'Malicious activity detected'
    end

    cookie_access_token(tokens[:access])
    render json: { csrf: tokens[:csrf] }
  end
end
