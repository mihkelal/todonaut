# frozen_string_literal: true

module Notes
  class Update < ApplicationService
    attr_accessor :note, :params

    def perform
      attach_files
      update_attributes!
    end

    private

    def attach_files
      note.files.attach(params.require(:note).require(:files))
    end

    def update_attributes!
      note.update!(params.require(:note).permit(:title, :description, :started_at, :ended_at))
    end
  end
end
