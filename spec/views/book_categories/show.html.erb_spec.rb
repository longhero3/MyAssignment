require 'spec_helper'

describe "book_categories/show" do
  before(:each) do
    @book_category = assign(:book_category, stub_model(BookCategory,
      :book_id => 1,
      :category_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
