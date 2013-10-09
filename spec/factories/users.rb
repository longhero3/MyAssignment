# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
  	username { Faker::Name.name}
    full_name { Faker::Name.name}
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password "123"
    # password_confirmation "123"
    birthday Date.new(1991,9,13)
    phone "2345234543243"
  end
end
