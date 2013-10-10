require 'spec_helper'

describe OrderLine do
  let(:cart) { FactoryGirl.create(:cart) }
  let(:book) { FactoryGirl.create(:book) }
  describe "validations" do 
    it{ should belong_to :order }
    it{ should belong_to :book }
    it{ should belong_to :cart }
  end

  describe ".total_price" do 
    before do 
      book.update_attributes({:price => 1.2})
      cart.add_book(book.id).save
      cart.add_book(book.id).save
    end
    
    it "should calculate the correct total price" do 
      expect(OrderLine.first.total_price).to eq(2.4)
    end
  end
end
