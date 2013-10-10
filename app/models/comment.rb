class Comment < ActiveRecord::Base
  attr_accessible :rating, :book_id, :comment_date, :content, :user_id

  belongs_to :user
  belongs_to :book

  class << self
    def add_comment(commend_hash)
  	  book = Book.find_by_id(commend_hash[:book_id])
  	  book.rating_count += 1
  	  book.total_rating_value += commend_hash[:rating].to_i
  	  book.save
  	  Comment.new(commend_hash)
    end
  end
end
