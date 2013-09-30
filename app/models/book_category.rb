class BookCategory < ActiveRecord::Base
  attr_accessible :book_id, :category_id

  belongs_to :book
  belongs_to :category
end
