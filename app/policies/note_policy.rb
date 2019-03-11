# frozen_string_literal: true

class NotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.not_completed.where(user: user.presence)
    end
  end

  def show?
    record.user == user.presence
  end

  def update?
    return false if record.completed?

    show?
  end

  def complete?
    update?
  end
end
