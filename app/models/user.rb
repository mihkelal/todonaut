# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password_digest, uniqueness: true, presence: true
end
