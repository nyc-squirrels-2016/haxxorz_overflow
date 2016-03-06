require 'rails_helper'

describe Comment do
  let(:user) {FactoryGirl.create(:user)}
  let (:question) {FactoryGirl.create(:question)}
  let (:answer) {FactoryGirl.create(:answer)}
  let(:comment) {Comment.create(user_id: 1, commentable_id: 1, commentable_type: "Question", body: "yo")}
  context "vote_count" do
    it "counts the comment's votes" do
      Vote.create(user_id: user.id, votable_id: comment.id, votable_type: "Comment", value: 1)
      Vote.create(user_id: 2, votable_id: comment.id, votable_type: "Comment", value: 1)
      expect(comment.vote_count).to eq(2)
    end
  end
end