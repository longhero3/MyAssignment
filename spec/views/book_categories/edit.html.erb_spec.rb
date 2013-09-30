require 'spec_helper'

describe "book_categories/edit" do
  before(:each) do
    @book_category = assign(:book_category, stub_model(BookCategory,
      :book_id => 1,
      :category_id => 1
    ))
  end

  it "renders the edit book_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", book_category_path(@book_category), "post" do
      assert_select "input#book_category_book_id[name=?]", "book_category[book_id]"
      assert_select "input#book_category_category_id[name=?]", "book_category[category_id]"
    end
  end
end
