class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true, touch: true
  belongs_to :user
  has_many :votes, as: :votable

  validates :user_id, :commentable_id, :commentable_type, :body, presence: true

  def vote_count
    ups = Vote.where(votable_id: self.id, votable_type: "Comment", value: 1).count
    downs = Vote.where(votable_id: self.id, votable_type: "Comment", value: -1).count
    return ups - downs
  end


end
