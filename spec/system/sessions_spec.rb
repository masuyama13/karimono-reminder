# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ログイン・ログアウト", type: :system do
  before do
    FactoryBot.create(:user, name: "Alice", email: "alice@example.com", password: "password")
  end

  context "正しいメールアドレスと正しいパスワードを入力したとき" do
    example "ログインとログアウトができる" do
      visit login_path
      within "form[name=login]" do
        fill_in "メールアドレス", with: "alice@example.com"
        fill_in "パスワード", with: "password"
      end
      click_button "ログイン"
      expect(page).to have_content "ログインしました。"
      click_on "ログアウト"
      expect(page).to have_content "ログアウトしました。"
    end
  end

  context "正しくないメールアドレスと正しいパスワードを入力したとき" do
    example "ログインできない" do
      visit login_path
      within "form[name=login]" do
        fill_in "メールアドレス", with: "xxx@example.com"
        fill_in "パスワード", with: "password"
      end
      click_button "ログイン"
      expect(page).to have_content "ユーザー名かパスワードが違います。"
    end
  end
end
