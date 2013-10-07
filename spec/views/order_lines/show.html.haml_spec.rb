require 'spec_helper'

describe "order_lines/show" do
  before(:each) do
    @order_line = assign(:order_line, stub_model(OrderLine))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
