require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create :user}
  users = FactoryGirl.create_list(:user,20)

  describe 'validations' do
    it{ should have_many(:orders)}
    it{ should have_many(:comments)}

    it{ should validate_presence_of :username}
    it{ should validate_presence_of :full_name}
    it{ should validate_presence_of :email}
    it{ should validate_uniqueness_of :username}
    it{ should validate_uniqueness_of :email}
    
    it "should validate email format" do
      user.email = "aloha@assd"
      user.should_not be_valid
      user.email = "aloha@yahoo.com"
      user.should be_valid
    end


end
