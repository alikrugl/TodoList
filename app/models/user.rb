# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::Serializers::JSON
  has_secure_password
  has_many :todos

  enum role: %i[user manager admin].freeze

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  def attributes
    { id:, email:, role: }
  end

  def generate_password_token!
    loop do
      self.reset_password_token = SecureRandom.urlsafe_base64
      break unless User.exists?(reset_password_token:)
    end
    self.reset_password_token_expires_at = 1.day.from_now
    save!
  end

  def clear_password_token!
    self.reset_password_token = nil
    self.reset_password_token_expires_at = nil
    save!
  end
end
