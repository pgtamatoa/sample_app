FactoryGirl.define do
  factory :comment do
    user
    post
    text "Lorem ipsum."
  end
end