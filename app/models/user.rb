# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :password_digest, uniqueness: true, presence: true
end
