require 'spec_helper'

describe CategoriesController do
  let(:user) { FactoryGirl.create(:user, :admin => true) }
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

    describe "with invalid params" do
      it "assigns a newly created but unsaved category as @category" do
        Category.any_instance.stub(:save).and_return(false)
        post :create, {:category => {} }, valid_session
        assigns(:category).should be_a_new(Category)
      end
      it "re-render new template do" do
        Category.any_instance.stub(:save).and_return(false)
        post :create, {:category => {} }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT #update" do 
    describe "with valid params" do
      it "update the requested category" do
        category = FactoryGirl.create(:category)
        Category.any_instance.should_receive(:update_attributes).with({"name" => "Others" })
        put :update, {:id => category.id, :category => { "name" => "Others" } }, valid_session 
      end

      it "assigns the requested category as @category" do 
        category_attrs = FactoryGirl.attributes_for(:category)
        category = FactoryGirl.create(:category)
        put :update, {:id => category.id, :category => category_attrs }, valid_session
        assigns(:category).should eq(category)
      end

      it "redirects to the categories url" do 
        category_attrs = FactoryGirl.attributes_for(:category)
        category = FactoryGirl.create(:category)
        put :update, {:id => category.id, :category => category_attrs }, valid_session
        response.should redirect_to(category)
      end
    end

    describe "with invalid params" do 
      it "assigns the category as @ category" do
        category = FactoryGirl.create(:category)
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.id, :category => {} }, valid_session
        assigns(:category).should eq(category)
      end
      it "re-renders the edit template" do 
        category = FactoryGirl.create(:category)
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.id, :category => {} }, valid_session
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do 
    it "destroys the requested category" do 
      category = FactoryGirl.create(:category)
      expect {
        delete :destroy, { :id => category.id }, valid_session
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the category list" do 
      category = FactoryGirl.create(:category)
      delete :destroy, { :id => category.id}, valid_session
      response.should redirect_to(categories_url)
    end
  end
end
