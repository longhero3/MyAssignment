class OrderLine < ActiveRecord::Base
  attr_accessible :order_id, :book_id, :cart_id, :quantity, :unit_price

  belongs_to :order
  belongs_to :book
  belongs_to :cart

  def total_price
  	book.price * quantity
  end
end
