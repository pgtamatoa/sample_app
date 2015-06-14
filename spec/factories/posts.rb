FactoryGirl.define do
  sequence(:title, 7) { |n| "Article#{n}" }

  factory :post do
    user
    title
    content "Lorem ipsum"
  end
end