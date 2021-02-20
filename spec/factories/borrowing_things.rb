# frozen_string_literal: true

FactoryBot.define do
  factory :borrowing_thing do
    name { "借りた物" }
    borrow_from { "貸太" }
    user
  end
end
