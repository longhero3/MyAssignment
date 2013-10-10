class Order < ActiveRecord::Base
  attr_accessible :date, :shipping_address, :total_amount, :user_id

  belongs_to :user
  has_many :order_lines, dependent: :destroy

  validates :shipping_address, :presence => true

  class << self
    def create_order(order_params)  
      if order_params[:shipping_address].empty?
        return nil
      else 
        order=Order.new(order_params)
        order.save
        order
      end
    end
  end
end
