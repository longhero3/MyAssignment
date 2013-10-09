require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create :user }
  let(:new_user_params) { FactoryGirl.attributes_for(:user) } 
  describe 'validations' do
    it{ should have_many(:orders)}
    it{ should have_many(:comments)}
    
    it{ should validate_presence_of :username}
    it{ should validate_presence_of :full_name}
    it{ should validate_presence_of :email}
    it{ should validate_presence_of :phone}
    it{ should validate_uniqueness_of :email}
    
    it "should validate email format" do
      user.email = "aloha@assd"
      user.should_not be_valid
      user.email = "aloha@yahoo.com"
      user.should be_valid
    end

    it "should validate phone format" do
      user.phone = "123124adfd"
      user.should_not be_valid
      user.phone = "1232345245"
      user.should be_valid
    end
  end

  describe ".authenticate" do
    it "authenticate the user correctly" do
      result = User.authenticate(user.username, user.password)
      expect(result).to eq(user)
    end
  end

  describe ".add_user" do
    it "should add user correctly" do 
      User.add_user(new_user_params).save
      expect(User.count).to eq(1)
    end
  end

  describe ".confirm_user" do
    it "gets activated correctly" do 
      User.add_user(new_user_params).save
      User.confirm_user(User.first.confirmation_token)
      expect(User.first.confirmed_at).not_to eq(nil)
    end
  end

  describe '#clear_password' do

    it "clears the plain text password" do 
      user.clear_password
      expect(user.password).to eq(nil)
    end
  end


  describe '#update_password' do
    it "updates the password correctly" do 
      password_params = { :old => user.password, :new => "1", :confirm_new => "1" } 
      user.update_password(password_params)
      expect(user.password).to eq("1")
    end
  end
  
  describe '#update_email' do
    it "updates email correctly" do 
      email_params = { :old => user.email, :new => "longhero3@yahoo.com", :password => "123" } 
      user.update_email(email_params)
      expect(user.email).to eq(email_params[:new])
    end 
  end
end