FactoryBot.define do
  factory :flavor do
    name {'テストフレーバー'}
    association :category
  end
end
