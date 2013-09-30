require 'spec_helper'

describe "soa/users/new" do
  before(:each) do
    assign(:soa_user, stub_model(Soa::User).as_new_record)
  end

  it "renders new soa_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", soa_users_path, "post" do
    end
  end
end
