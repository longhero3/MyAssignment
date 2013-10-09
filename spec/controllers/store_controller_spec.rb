require 'spec_helper'

describe StoreController do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { {} }
  describe "GET 'index'" do
    it "returns http success" do
      get :index, {}, {}
      response.should render_template :index
    end
  end

end
