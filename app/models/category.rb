class Category < ActiveRecord::Base
  attr_accessible :name, :sort_order
  has_many :book_categories
end
