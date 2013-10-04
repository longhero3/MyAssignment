# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
  	username { Faker::Name.name}
    full_name { Faker::Name.name}
    sequence(:email) {|n| "email#{n}@yahoo.com"}
    hash_password "1234"
    phone "2345234543243"
  end
end
