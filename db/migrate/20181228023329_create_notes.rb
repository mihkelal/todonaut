class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.timestamp :started_at
      t.timestamp :ended_at
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
