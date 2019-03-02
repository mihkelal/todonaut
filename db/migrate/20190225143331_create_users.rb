# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username, index: { unique: true }, null: false
      t.string :password_digest, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
