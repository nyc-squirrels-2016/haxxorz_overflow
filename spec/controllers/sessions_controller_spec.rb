require 'rails_helper'
describe SessionsController do
  context "new" do
    it "successfully gets a page" do
      get :new
      expect(response).to be_success
    end
  end
  context "#create" do
    let(:user) {FactoryGirl.create :user}
    it "redirects to root path with correct information" do
      post :create, username: user.username, password: user.password
      expect(response).to redirect_to root_path
    end
    it "returns to login page with bad username" do
      post :create, email: "you_idiot@spaceballs.com", password: user.password
      expect(response).to render_template('sessions/new')
    end
    it "returns to login page with bad password" do
      post :create, email: user.email, password: "arglebargle"
      expect(response).to render_template('sessions/new')
    end
  end
  context "#destroy" do
    let(:user) {FactoryGirl.create :user}
    it "clears the session[:user_id]" do
      post :create, username: user.username, password: user.password
      post :destroy
      expect(session[:user_id]).to eq(nil)
    end
  end
end
