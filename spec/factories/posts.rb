FactoryGirl.define do

  factory :post do
    user
    title "Titre article"
    content "Lorem ipsum"
  end
end