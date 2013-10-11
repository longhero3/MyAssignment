class OrderLine < ActiveRecord::Base
  attr_accessible :order_id, :book_id, :cart_id, :quantity, :unit_price

  belongs_to :order
  belongs_to :book
  belongs_to :cart

  def total_price
    book.price * quantity
  end

  class << self
    def update_order_lines(in_order_id,in_cart_id)
      order_lines = OrderLine.where('cart_id = ?', "#{in_cart_id}")
      order_lines.update_all(:order_id => in_order_id, :cart_id => nil)    
    end
  end
end
