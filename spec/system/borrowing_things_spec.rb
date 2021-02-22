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
end
