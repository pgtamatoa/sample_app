FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@hellojam.fr" }

  factory :user do
    name "John Doe"
    email
    password "password"
    password_confirmation "password"
  end
end