require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = create(:user)
  end

  context 'ログイン情報が正しいとき' do
    before do
      visit login_path
    end
    it 'ユーザーはログインできる' do
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: "password"
      click_button 'ログイン'
      expect(current_path).to eq root_path
    end
  end

  context 'ログイン情報が誤っているとき' do
    before do
      visit login_path
    end
    it 'ユーザーはログインできない' do
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: "plmplm"
      click_button 'ログイン'
      expect(current_path).to eq login_path
    end
  end
end
