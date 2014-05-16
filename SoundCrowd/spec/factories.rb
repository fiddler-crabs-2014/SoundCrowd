FactoryGirl.define do
  factory :playlist do
    name { Faker::Lorem.word }
    user
  end

  factory :user do
    sequence(:email) { |n| "user-#{n}@gmail.com" }
    password Faker::Name.name
  end
end
