# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
  	name { Faker::Name.name }
  	sequence(:sort_order) { |n| n }
  end
end
