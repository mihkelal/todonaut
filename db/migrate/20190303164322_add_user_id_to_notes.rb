# frozen_string_literal: true

class AddUserIdToNotes < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :notes, :user, type: :uuid, foreign_key: { on_delete: :cascade }, index: true
  end
end
