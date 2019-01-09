class Note < ApplicationRecord
  def completed?
    completed_at&.< Time.current
  end
end
