require 'spec_helper'

describe "order_lines/new" do
  before(:each) do
    assign(:order_line, stub_model(OrderLine).as_new_record)
  end

  it "renders new order_line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_lines_path, "post" do
    end
  end
end
