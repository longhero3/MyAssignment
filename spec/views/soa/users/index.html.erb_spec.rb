require 'spec_helper'

describe "soa/users/index" do
  before(:each) do
    assign(:soa_users, [
      stub_model(Soa::User),
      stub_model(Soa::User)
    ])
  end

  it "renders a list of soa/users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
