# frozen_string_literal: true

class Register < ApplicationService
  attr_accessor :username, :password, :password_confirmation

  validates :username, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def perform
    return true if user.save

    add_errors
    raise ActiveRecord::RecordInvalid, self
  end

  def user
    @user ||= User.new(username: username, password: password, password_confirmation: password_confirmation)
  end

  private

  def add_errors
    errors.merge!(user.errors)
  end
end
