class Category < ActiveRecord::Base
  attr_accessible :name, :sort_order
  has_many :book_categories
  has_many :books, through: :book_categories
end
