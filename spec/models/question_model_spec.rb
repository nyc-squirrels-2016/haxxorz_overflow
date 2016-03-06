require 'rails_helper'

describe Question do
  let(:user) {FactoryGirl.create(:user)}
  let(:question) {FactoryGirl.create(:question)}
  context "vote_count" do
    it "counts the question's votes" do
      Vote.create(user_id: user.id, votable_id: question.id, votable_type: "Question", value: 1)
      Vote.create(user_id: 2, votable_id: question.id, votable_type: "Question", value: 1)
      expect(question.vote_count).to eq(2)
    end
  end
end