# frozen_string_literal: true

class NoteDecorator < Draper::Decorator
  delegate_all

  def started_at
    object.started_at && l(object.started_at, format: :long)
  end

  def ended_at
    object.ended_at && l(object.ended_at, format: :long)
  end

  def completed_at
    object.completed_at && l(object.completed_at, format: :long)
  end
end
