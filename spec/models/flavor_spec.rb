require 'rails_helper'

RSpec.describe Flavor, type: :model do
  before do
    @flavor = build(:flavor)
  end

  context 'フレーバーを登録するとき' do
    it 'フレーバー名が入力されていること' do
      expect(@flavor).to be_valid
    end

    it 'フレーバー名が空欄でないこと' do
      @flavor.name = ' '
      expect(@flavor).to be_invalid
    end
  end
end
