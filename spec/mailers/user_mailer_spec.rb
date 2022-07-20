# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:mail) { UserMailer.reset_password(user) }

  describe 'reset password' do
    it 'renders the headers' do
      expect(mail.subject).to eq('Reset your password')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['alikrugl11@gmail.com'])
    end

    it 'renders the body' do
      mail_body = mail.body.encoded
      expect(mail_body).to match("Hi #{user.email}")
      expect(mail_body).to match('You have requested to reset your password.')
    end
  end
end
