require 'spec_helper'

describe Cart do
  let(:cart) { FactoryGirl.create(:cart) }
  describe "validation" do 
  	it{should have_many(:order_lines).dependent(:destroy)}
  end

  describe "class method tests" do
  	
  end
end
