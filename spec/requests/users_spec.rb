require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works!" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/1" do
    it "works!" do
      user = FactoryBot.create(:user)
      get users_path(user.to_param)
      expect(response).to have_http_status(200)
    end
  end
end
