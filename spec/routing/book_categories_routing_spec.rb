require "spec_helper"

describe BookCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/book_categories").should route_to("book_categories#index")
    end

    it "routes to #new" do
      get("/book_categories/new").should route_to("book_categories#new")
    end

    it "routes to #show" do
      get("/book_categories/1").should route_to("book_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/book_categories/1/edit").should route_to("book_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/book_categories").should route_to("book_categories#create")
    end

    it "routes to #update" do
      put("/book_categories/1").should route_to("book_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/book_categories/1").should route_to("book_categories#destroy", :id => "1")
    end

  end
end
