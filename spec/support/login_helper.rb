# frozen_string_literal: true

module LoginHelper
  def login_user(email, password = "password")
    visit login_path
    fill_in "メールアドレス", with: email
    fill_in "パスワード", with: password
    click_button "ログイン"
  end
end
