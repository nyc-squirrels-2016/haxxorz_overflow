require 'rails_helper'
describe UsersController do
  context "#new" do
    it "pulls up the signup page" do
      get :new
      expect(response).to render_template :new
    end
  end
  context "#create" do
    it "redirects to the root path with valid input" do
      post :create, user: {username: "test", password: "password", email:"a@example.com"}
      expect(response).to redirect_to root_path
    end
    it "re-renders the new user page with invalid input" do
      post :create, user: {username: nil, password: "password", email:"v@example.com"}
      expect(response).to render_template :new
    end
  end
end
