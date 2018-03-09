FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    sequence(:username) { |n| "user##{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
