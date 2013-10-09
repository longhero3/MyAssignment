require 'spec_helper'

describe SessionsController do
  describe "GET 'new'" do
    it "renders the login pane" do
      get :new
      response.should render_template :new
    end
  end
end
