require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = create(:user)
  end

  context 'ユーザーがログインするとき' do
    before do
      visit login_path
    end
    it 'ユーザーはログインできる' do
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'
      expect(current_path).to eq root_path
    end
  end
end
