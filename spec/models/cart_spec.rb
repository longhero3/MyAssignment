require 'spec_helper'

describe Cart do
  let(:cart) { FactoryGirl.create(:cart) }
  let(:book) { FactoryGirl.create(:book) }
  describe "validations" do 
    it{ should have_many(:order_lines).dependent(:destroy) }
  end

  describe "class method tests" do
    before(:each) do
      book.update_attributes({:price => 1.2})
      cart.add_book(book.id).save
      cart.add_book(book.id).save
    end
    it "adds order line item quantity by one " do 
      expect(cart.order_lines[0].quantity).to eq(2)
    end

    it "reduce order line item quantity by one" do 
      cart.minus_quantity(book.id).save
      expect(cart.order_lines[0].quantity).to eq(1)
    end

    it "will destroy order item when the quantity comes to 0" do 
      cart.minus_quantity(book.id).save
      cart.minus_quantity(book.id).save
      expect(cart.order_lines.count).to eq(0)
    end

    it "calculate total price correctly" do 
      expect(cart.total_price).to eq(2.4)
    end

    it "adds more book items when the added books are different" do
      new_book = FactoryGirl.create(:book)
      cart.add_book(new_book.id).save
      expect(cart.order_lines.count).to eq(2)
    end 
  end
end
