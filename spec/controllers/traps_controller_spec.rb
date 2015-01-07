require 'rails_helper'

RSpec.describe TrapsController, :type => :controller do

  describe "GET info" do
    it "returns http success" do
      get :info
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
