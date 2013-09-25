class Order < ActiveRecord::Base
  attr_accessible : date, :shipping_address, :total_amount, :user_id
end
