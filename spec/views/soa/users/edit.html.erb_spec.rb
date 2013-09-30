require 'spec_helper'

describe "soa/users/edit" do
  before(:each) do
    @soa_user = assign(:soa_user, stub_model(Soa::User))
  end

  it "renders the edit soa_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", soa_user_path(@soa_user), "post" do
    end
  end
end
