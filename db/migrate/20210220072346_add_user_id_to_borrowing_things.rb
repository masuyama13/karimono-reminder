# frozen_string_literal: true

class AddUserIdToBorrowingThings < ActiveRecord::Migration[6.0]
  def change
    add_reference :borrowing_things, :user, null: false, index: true
  end
end
