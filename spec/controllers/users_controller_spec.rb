require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = FactoryBot.create(:user)
      get :show, params: {id: user.to_param}
      expect(response).to be_success
    end
  end
end
