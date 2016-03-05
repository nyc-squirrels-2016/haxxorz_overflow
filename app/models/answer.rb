class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :body, :user_id, :question_id, presence: true

  def vote_count
    Vote.where(votable_id: self.id, votable_type: "Answer").count
  end


end
