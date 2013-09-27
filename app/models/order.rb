class Order < ActiveRecord::Base
  attr_accessible :date, :shipping_address, :total_amount, :user_id

  belongs_to :user
  has_many :order_lines
end
