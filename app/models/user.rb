class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password
end
