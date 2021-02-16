# frozen_string_literal: true

class BorrowingThing < ApplicationRecord
  validates :name, presence: true # TODO: lengthを設定する
  validates :borrow_from, presence: true # TODO: lengthを設定する
  validate :remind_on_should_be_after_borrowed_on

  private
    def remind_on_should_be_after_borrowed_on
      return unless remind_on && borrowed_on

      if remind_on <= borrowed_on
        errors.add(:remind_on, "は貸借日よりも後に設定してください")
      end
    end
end
