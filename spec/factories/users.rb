FactoryBot.define do
  factory :user do
    name { 'ใในใ' }
    email { 'test@sample.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
