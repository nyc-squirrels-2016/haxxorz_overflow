require 'rails_helper'

describe VotesController do
  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question)}
  before(:each) do
    stub_current_user(user)
  end

  context "Create" do
    it "creates a new vote object if given valid inputs" do
    # binding.pry
    expect{
      vote = Vote.create(user_id: user.id, votable_id: question.id, votable_type: "Question", value: 1)}.to change{Vote.all.count}.by(1)

    end

    it "does not create a new vote if inputs are invalid" do

    end
  end
end