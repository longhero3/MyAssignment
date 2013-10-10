require 'spec_helper'

describe Order do
  describe "validations" do 
    it{ should belongs_to :user }
    it{ should have_many(:order_lines).dependent(:destroy) }
    it{ should validate_presence_of(:shipping_address) }
  end

  describe ".create_order" do 
    it "creates order with valid shipping address" do 
      order_params = { :date => Time.current.to_date, 
                       :total_amount => 12.23,
                       :user_id => 1,
                       :shipping_address => "575 Cmt8" }
      Order.create_order(order_params).save
      expect(Order.count).to eq(1)
    end
  end
end
