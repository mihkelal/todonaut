module Notes
  class Complete < ApplicationService
    attr_accessor :note

    validate :note_not_completed

    def perform
      @note.update!(completed_at: Time.current)
    end

    private

    def note_not_completed
      errors.add(:base, :completed, message: 'Note already completed') if note.completed_at?
    end
  end
end
