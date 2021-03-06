class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, touch: true
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :body, :user_id, :question_id, presence: true

  def vote_count
    ups = Vote.where(votable_id: self.id, votable_type: "Answer", value: 1).count
    downs = Vote.where(votable_id: self.id, votable_type: "Answer", value: -1).count
    return ups - downs
  end


end
