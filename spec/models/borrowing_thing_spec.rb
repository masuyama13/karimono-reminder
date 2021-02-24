# frozen_string_literal: true

require "rails_helper"

RSpec.describe BorrowingThing, type: :model do
  describe "バリデーション" do
    example "remind_onがborrowed_onより後であれば有効" do
      borrowing_thing = FactoryBot.build(
        :borrowing_thing,
        borrowed_on: "2021-02-15",
        remind_on: "2021-02-16")
      expect(borrowing_thing).to be_valid
    end

    example "remind_onがborrowed_onより前であれば無効" do
      borrowing_thing = FactoryBot.build(
        :borrowing_thing,
        borrowed_on: "2021-02-16",
        remind_on: "2021-02-15")
      borrowing_thing.valid?
      expect(borrowing_thing.errors[:remind_on]).to include("は貸借日よりも後に設定してください")
    end
  end
end
