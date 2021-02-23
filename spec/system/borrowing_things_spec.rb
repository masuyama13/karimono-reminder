# frozen_string_literal: true

require "rails_helper"

RSpec.describe "かりもの管理機能", type: :system do
  describe "一覧表示する" do
    before do
      alice = FactoryBot.create(:user, name: "Alice", email: "alice@example.com")
      FactoryBot.create(:borrowing_thing, name: "CD", user: alice)
    end

    context "Aliceがログインしているとき" do
      before do
        login_user("alice@example.com")
      end
      example "Aliceが登録したかりものが表示される" do
        expect(page).to have_content "CD"
      end
    end

    context "Bobがログインしているとき" do
      before do
        FactoryBot.create(:user, name: "Bob", email: "bob@example.com")
        login_user("bob@example.com")
      end
      example "Aliceが登録したかりものが表示されない" do
        expect(page).to have_no_content "CD"
      end
    end
  end

  describe "新規登録する" do
    before do
      FactoryBot.create(:user, email: "test@example.com")
    end

    context "ユーザーがログインしているとき" do
      example "かりものを新規登録できる" do
        login_user("test@example.com")
        visit new_borrowing_thing_path
        within "form[name=borrowing_thing]" do
          fill_in "名称", with: "新しいかりもの"
          fill_in "相手", with: "持ち主"
        end
        click_on "登録する"
        visit borrowing_things_path
        expect(page).to have_content "新しいかりもの"
      end
    end
  end

  describe "編集する" do
    before do
      user = FactoryBot.create(:user, email: "test@example.com")
      FactoryBot.create(:borrowing_thing, name: "借りた物", user: user)
    end

    context "ユーザーがログインしているとき" do
      before do
        login_user("test@example.com")
      end
      example "登録されているかりものを編集する" do
        visit borrowing_things_path
        click_on "Edit"
        within "form[name=borrowing_thing]" do
          fill_in "名称", with: "借りている物"
        end
        click_on "更新する"
        visit borrowing_things_path
        expect(page).to have_no_content "借りた物"
        expect(page).to have_content "借りている物"
      end
    end
  end

  describe "削除する" do
    before do
      user = FactoryBot.create(:user, email: "test@example.com")
      FactoryBot.create(:borrowing_thing, name: "借りた物", user: user)
    end

    context "ユーザーがログインしているとき" do
      before do
        login_user("test@example.com")
      end
      example "登録されているかりものを削除する", js: true do
        visit borrowing_things_path
        accept_confirm do
          click_on "Destroy"
        end
        expect(page).to have_no_content "借りた物"
      end
    end
  end
end
