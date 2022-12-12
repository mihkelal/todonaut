# frozen_string_literal: true

class Login < ApplicationService
  attr_accessor :username, :password

  validates :username, presence: true
  validates :password, presence: true

  def perform
    return true if authentication_successful?

    add_errors
    false
  end

  def user
    @user ||= User.find_by(username:)&.authenticate(password)
  end

  private

  def authentication_successful?
    user.present?
  end

  def add_errors
    errors.add(:base, I18n.t('global.incorrect_username_password'))
  end
end
