# frozen_string_literal: true

module Sessions
  class Login < ApplicationService
    attr_accessor :username, :password, :session

    validates :username, presence: true
    validates :password, presence: true

    def perform
      if authentication_successful?
        session[:user_id] = user&.id
      else
        errors.add(:base, 'Incorrect username or password')
        false
      end
    end

    private

    def authentication_successful?
      user.present?
    end

    def user
      User.find_by(username: username)&.authenticate(password)
    end
  end
end
