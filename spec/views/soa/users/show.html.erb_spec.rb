require 'spec_helper'

describe "soa/users/show" do
  before(:each) do
    @soa_user = assign(:soa_user, stub_model(Soa::User))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
