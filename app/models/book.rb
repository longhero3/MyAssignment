class Book < ActiveRecord::Base
  attr_accessible : title, :author, :description, :img_url, :price, :published_date, :publisher, :rating_count, :total_rating_value
  has_many :comments
  has_many :order_lines
end
