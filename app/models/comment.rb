class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :votes, as: :votable

  validates :user_id, :commentable_id, :commentable_type, :body, presence: true
end
