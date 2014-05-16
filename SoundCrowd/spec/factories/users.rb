FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Name.name
  end
end
