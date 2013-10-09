# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :confirmed_user do
  	username { Faker::Name.name}
    full_name { Faker::Name.name}
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password "1234"
    password_confirmation "1234"
    birthday Date.new(1991,9,13)
    phone "2345234543243"
    confirmed_at Datetime.now
  end
end