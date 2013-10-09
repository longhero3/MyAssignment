require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create :user }
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

  describe 'class methods' do 
    it "authenticate the user correctly" do
      result = User.authenticate(user.username, user.password)
      expect(result).to eq(user)
    end

    it "should add user correctly" do 
      second_user_params = FactoryGirl.attributes_for(:user)
      User.add_user(second_user_params).save
      expect(User.count).to eq(1)
    end

    it "gets activated correctly" do 
      new_user_attributes = FactoryGirl.attributes_for(:user)
      User.add_user(new_user_attributes).save
      User.confirm_user(User.first.confirmation_token)
      expect(User.first.confirmed_at).not_to eq(nil)
    end

    it "clears the plain text password" do 
      user.clear_password
      expect(user.password).to eq(nil)
    end

    it "updates the password correctly" do 
      password_params = {}
      password_params[:old] = user.password
      password_params[:new] = "1"
      password_params[:confirm_new] = "1"
      user.update_password(password_params)
      expect(user.password).to eq("1")
    end

    it "updates email correctly" do 
      email_params = {}
      email_params[:old] = user.email
      email_params[:new] = "longhero3@yahoo.com"
      email_params[:password] = "123"
      user.update_email(email_params)
      expect(user.email).to eq(email_params[:new])
    end 
  end
end