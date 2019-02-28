# frozen_string_literal: true

module Users
  class Create < ApplicationService
    attr_accessor :username, :password, :password_confirmation, :session

    validates :username, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true

    def perform
      if user.save
        log_user_in
      else
        add_errors
        raise ActiveRecord::RecordInvalid, self
      end
    end

    private

    def user
      @user ||= User.new(username: username, password: password, password_confirmation: password_confirmation)
    end

    def log_user_in
      session[:user_id] = user.id
    end

    def add_errors
      errors.merge!(user.errors)
    end
  end
end
