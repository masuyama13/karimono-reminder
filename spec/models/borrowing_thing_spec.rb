# frozen_string_literal: true

require "rails_helper"

describe BorrowingThing do
  # remind_onがborrowed_onより後であれば有効な状態であること
  it "is valid with remind_on is after borrowed_on" do
    borrowing_thing = BorrowingThing.new(
      name: "CD",
      borrow_from: "Alice",
      borrowed_on: "2021-02-15",
      remind_on: "2021-02-16")
    expect(borrowing_thing).to be_valid
  end
  # remind_onがborrowed_onより前であれば無効な状態であること
  it "is invalid with remind_on is before borrowed_on" do
    borrowing_thing = BorrowingThing.new(
      name: "CD",
      borrow_from: "Alice",
      borrowed_on: "2021-02-16",
      remind_on: "2021-02-15")
    borrowing_thing.valid?
    expect(borrowing_thing.errors[:remind_on]).to include("は貸借日よりも後に設定してください")
  end
end
