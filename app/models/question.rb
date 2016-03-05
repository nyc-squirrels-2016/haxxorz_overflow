class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :body, :user_id, presence: true


  def vote_count
    Vote.where(votable_id: self.id, votable_type: "Question").count
  end

end
