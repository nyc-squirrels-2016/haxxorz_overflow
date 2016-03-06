require 'rails_helper'
#require_relative '../support/authentication_helpers.rb'

describe QuestionsController do
  context "index" do
    it "renders index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  context "show" do
    let(:question) {FactoryGirl.create(:question)}
    it "renders show template" do
      get :show, id: question.id
      expect(response.status).to eq(200)
    end
  end

  context "new" do
    it "renders the new question form page" do
      get :new
      expect(response).to render_template :new
    end
  end

  context "create" do
    # let(:user) {FactoryGirl.create(:user)}
    # it "redirects with valid question" do
    #   stub_current_user(user)
    #   post :create, params = {question: {title:"thing", body: "whatchamawhosit"}}
    #   expect(response.status).to eq(302)
    # end
    it "re-renders the page with invalid question" do
      post :create, params = {question: {title: nil, body: "thingy"}}
      expect(response).to render_template :new
    end
  end
end
