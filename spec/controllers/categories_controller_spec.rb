require 'spec_helper'

describe CategoriesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { {:user_id => user.id} }

  describe "GET #index " do
    it "populates category data" do
      categories = FactoryGirl.create_list(:category, 2)
      get :index, {}, valid_session
      assigns(:categories).should eq(categories)
    end
    it "renders the :index view" do 
      get :index, {}, valid_session
      response.should render_template :index
    end
  end

  describe "GET #new " do
    it "assigns a new category as @category" do
      get :new, {}, valid_session
      assigns(:category).should be_a_new(Category)
    end
  end

  describe "get #show" do
    it "assigns requested category as @category" do 
      category = FactoryGirl.create(:category)
      get :show, {:id => category.id}, valid_session
      assigns(:category).should eq(category)
    end
  end

  describe "get #edit" do 
    it "assign edited category as @category" do
      category = FactoryGirl.create(:category)
      get :edit, {:id => category.id}, valid_session
      assigns(:category).should eq(category)
    end
  end

  describe "POST #create" do
    describe "with a valid params " do 
      it "creates a new Category" do 
        category_attrs = FactoryGirl.attributes_for(:category)
        expect {
          post :create, { :category => category_attrs }, valid_session
        }.to change(Category, :count).by(1)
      end

      it "assigns newly create category as @category" do 
        category_attrs = FactoryGirl.attributes_for(:category)
        post :create, { :category => category_attrs }, valid_session
        assigns(:category).should be_a(Category)
        assigns(:category).should be_persisted
      end

      it "should redirect to categories url" do 
        category_attrs = FactoryGirl.attributes_for(:category)
        post :create, { :category => category_attrs }, valid_session
        response.should redirect_to(categories_url)
      end
    end
  end
end
