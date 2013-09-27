# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
  	sequence(:price) {|n| n + 3}
  	title { Faker::Commerce.product_name }
  	author { Faker::Name.name}
  	description { Faker::Lorem.sentence }
  	sequence(:img_url) {|n| "#{n}_img.png" }
  	published_date "12/10/2013"
  	sequence(:publisher) {|n| "Publisher #{n}"}
  	sequence(:rating_count) {|n| n}
  	sequence(:total_rating_value) {|n| n + 2}
  end
end
