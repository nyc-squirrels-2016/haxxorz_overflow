class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :body, :user_id, presence: true


  def vote_count
    # self.votes.inject(0){||}
    # Consider refactoring - Devin has an idea
    ups = Vote.where(votable_id: self.id, votable_type: "Question", value: 1).count
    downs = Vote.where(votable_id: self.id, votable_type: "Question", value: -1).count
    return ups - downs
  end

  def self.sort_by_trending
    Question.all.includes(:user).order(updated_at: :desc)
  end

  def self.sort_by_recent
    Question.all.includes(:user).order(created_at: :desc)
  end

  def self.sort_by_votes
    Question.all.includes(:user).sort_by(&:vote_count).reverse
  end

end
