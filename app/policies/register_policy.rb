# frozen_string_literal: true

class RegisterPolicy < ApplicationPolicy
  def create?
    !logged_in?
  end
end
