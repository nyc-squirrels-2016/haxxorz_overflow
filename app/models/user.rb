class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password



  def questions_answered
    questions_answered = []
    self.answers.each do |ans|
      questions_answered << Question.find(ans.question_id)
    end
    return questions_answered
  end
end
