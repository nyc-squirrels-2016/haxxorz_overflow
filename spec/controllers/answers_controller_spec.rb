require 'rails_helper'


describe AnswersController do
  let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    stub_current_user(user)
  end

  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  context "#create" do
    let(:question) {FactoryGirl.create(:question)}
    it "refreshes the question page" do
      answer = post :create, params ={answer: {body: "This is an answer"}, question_id: question.id}
      response.should redirect_to "where_i_came_from"
    end
  end
end
