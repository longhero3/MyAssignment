# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
  	username { Faker::Name.name}
    full_name { Faker::Name.name}
    email "s3324816@rmit.edu.vn"
    hash_password "1234"
    phone "2345234543243"
  end
end
