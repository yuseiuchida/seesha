FactoryBot.define do
  factory :user do
    name {'テスト'}
    email {'test@sample.com'}
    password {'password'}
    password_confirmation {'password'}
  end
end
