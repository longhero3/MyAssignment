class OrderLine < ActiveRecord::Base
  attr_accessible : order_id, :book_id, :quantity, :unit_price
end
