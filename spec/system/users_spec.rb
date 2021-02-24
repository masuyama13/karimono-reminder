# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ユーザー", type: :system do
  example "新規登録する" do
    visit root_path
    click_on "メールアドレスを登録してはじめる"
    within "form[name=user]" do
      fill_in "ユーザー名", with: "新規ユーザー"
      fill_in "メールアドレス", with: "new@example.com"
      fill_in "パスワード", with: "password"
      fill_in "パスワード（確認）", with: "password"
    end
    click_on "登録する"
    expect(page).to have_content "ユーザーを登録しました。"
  end

  example "ユーザー情報を表示する" do
    FactoryBot.create(:user, name: "テストユーザー", email: "test@example.com")
    login_user("test@example.com")
    click_on "ユーザー情報"
    expect(page).to have_content "test@example.com"
  end

  example "ユーザー情報を更新する" do
    user = FactoryBot.create(:user, name: "テストユーザー", email: "test@example.com")
    login_user("test@example.com")
    visit edit_user_path(user)
    within "form[name=user]" do
      fill_in "ユーザー名", with: "新しい名前"
    end
    click_on "更新する"
    expect(page).to have_content "ユーザー情報を更新しました。"
    expect(page).to_not have_content "テストユーザー"
    expect(page).to have_content "新しい名前"
  end

  example "ユーザー情報を削除する", js: true do
    user = FactoryBot.create(:user, name: "テストユーザー", email: "test@example.com")
    login_user("test@example.com")
    visit edit_user_path(user)
    accept_confirm do
      click_on "ユーザー削除"
    end
    expect(page).to have_content "ユーザー情報をすべて削除しました。ご利用ありがとうございました。"
  end
end
