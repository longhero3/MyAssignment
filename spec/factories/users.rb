FactoryGirl.define do
  factory :user do
  	username { Faker::Name.name}
  	full_name { Faker::Name.name}
  	sequence(:email) {|n| "email#{n}@yahoo.com"}
  	password "123"
  	phone "2345234543243"
  end
end
