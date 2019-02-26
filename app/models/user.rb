# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, if: -> { username.present? }
  validates :email, uniqueness: true, if: -> { email.present? }
  validates :password_digest, uniqueness: true, presence: true
  validate :username_or_email_presence

  private

  def username_or_email_presence
    return if username.present? || email.present?

    errors.add(:base, 'Username or email must be present')
  end
end
