class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :user_id, :votable_id, :votable_type, presence: true
  validates :user_id, uniqueness: {scope: :votable_id}
  validate :correct_value

  def correct_value
    unless self.value == 1 || self.value == -1
      errors.add(:value, "Invalid vote")
    end
  end
end
