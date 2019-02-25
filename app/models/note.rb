# frozen_string_literal: true

class Note < ApplicationRecord
  scope :started, -> { where(started_arel) }
  scope :not_started, -> { where(started_arel.not) }
  scope :ended, -> { where(ended_arel) }
  scope :not_ended, -> { where(ended_arel.not) }
  scope :completed, -> { where(completed_arel) }
  scope :not_completed, -> { where(completed_arel.not) }

  class << self
    def started_arel
      arel_table[:started_at].not_eq(nil).and(arel_table[:started_at].lt(Time.current))
    end

    def ended_arel
      arel_table[:ended_at].not_eq(nil).and(arel_table[:ended_at].lt(Time.current))
    end

    def completed_arel
      arel_table[:completed_at].not_eq(nil).and(arel_table[:completed_at].lt(Time.current))
    end
  end

  def completed?
    completed_at&.< Time.current
  end
end
