require 'rails_helper'

describe Answer do
  let(:user) {FactoryGirl.create(:user)}
  let(:answer) {FactoryGirl.create(:answer)}
  context "vote_count" do
    it "counts the answer's votes" do
      Vote.create(user_id: user.id, votable_id: answer.id, votable_type: "Answer", value: 1)
      Vote.create(user_id: 2, votable_id: answer.id, votable_type: "Answer", value: 1)
      expect(answer.vote_count).to eq(2)
    end
  end
end