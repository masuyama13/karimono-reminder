# frozen_string_literal: true

class CreateBorrowingThings < ActiveRecord::Migration[6.0]
  def change
    create_table :borrowing_things do |t|
      t.string :name, null: false
      t.string :borrow_from, null: false
      t.date :borrowed_on
      t.date :remind_on

      t.timestamps
    end
  end
end
