require "spec_helper"

describe OrderLinesController do
  describe "routing" do

    it "routes to #index" do
      get("/order_lines").should route_to("order_lines#index")
    end

    it "routes to #new" do
      get("/order_lines/new").should route_to("order_lines#new")
    end

    it "routes to #show" do
      get("/order_lines/1").should route_to("order_lines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/order_lines/1/edit").should route_to("order_lines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/order_lines").should route_to("order_lines#create")
    end

    it "routes to #update" do
      put("/order_lines/1").should route_to("order_lines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/order_lines/1").should route_to("order_lines#destroy", :id => "1")
    end

  end
end
