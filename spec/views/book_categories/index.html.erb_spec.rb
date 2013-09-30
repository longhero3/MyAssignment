require 'spec_helper'

describe "book_categories/index" do
  before(:each) do
    assign(:book_categories, [
      stub_model(BookCategory,
        :book_id => 1,
        :category_id => 2
      ),
      stub_model(BookCategory,
        :book_id => 1,
        :category_id => 2
      )
    ])
  end

  it "renders a list of book_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
