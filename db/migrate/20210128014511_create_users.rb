# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :notification
      t.datetime :last_accessed_at

      t.timestamps
      t.index :email, unique: true
    end
  end
end
