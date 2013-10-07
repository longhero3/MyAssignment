require 'spec_helper'

describe "order_lines/edit" do
  before(:each) do
    @order_line = assign(:order_line, stub_model(OrderLine))
  end

  it "renders the edit order_line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_line_path(@order_line), "post" do
    end
  end
end
