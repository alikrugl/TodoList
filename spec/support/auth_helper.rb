# frozen_string_literal: true


# A module that is used to sign in and sign out a user.
module AuthHelper
  def sign_in_as(user)
    payload = { user_id: user.id, aud: [user.role] }
    session = JWTSessions::Session.new(payload:)
    tokens = session.login
    request.cookies[JWTSessions.access_cookie] = tokens[:access]
    request.headers[JWTSessions.csrf_header] = tokens[:csrf] # for post/patch/delete/etc requests
  end

  def sign_out
    JWTSessions::Session.flush_all
  end
end
