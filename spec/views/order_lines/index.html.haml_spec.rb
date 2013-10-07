require 'spec_helper'

describe "order_lines/index" do
  before(:each) do
    assign(:order_lines, [
      stub_model(OrderLine),
      stub_model(OrderLine)
    ])
  end

  it "renders a list of order_lines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
