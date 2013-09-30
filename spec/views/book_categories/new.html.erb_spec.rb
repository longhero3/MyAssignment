require 'spec_helper'

describe "book_categories/new" do
  before(:each) do
    assign(:book_category, stub_model(BookCategory,
      :book_id => 1,
      :category_id => 1
    ).as_new_record)
  end

  it "renders new book_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", book_categories_path, "post" do
      assert_select "input#book_category_book_id[name=?]", "book_category[book_id]"
      assert_select "input#book_category_category_id[name=?]", "book_category[category_id]"
    end
  end
end
