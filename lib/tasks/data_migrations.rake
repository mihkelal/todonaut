# frozen_string_literal: true

namespace :data_migrations do
  desc 'Migrate note description to action text'

  task note_description_to_action_text: [:environment] do
    Note.transaction do
      Note.select(:id, Note.arel_table[:description].as('description_from_column')).find_each do |note|
        next if note.description.present?

        note.description = note[:description_from_column]
        note.save!
      end
    end
  end
end
