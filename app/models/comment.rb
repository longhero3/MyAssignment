class Comment < ActiveRecord::Base
  attr_accessible :rating, :book_id, :comment_date, :content, :user_id

  belongs_to :user
  belongs_to :book
end
