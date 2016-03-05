class VotesController < ApplicationController

  def create

    vote = Vote.new(user_id: current_user.id, value: params[:value])
    #probably split this to vote model
    if params.include?(:comment_id)
      comment = Comment.find(params[:comment_id])
      vote.votable = comment
    elsif params.include?(:answer_id)
      answer = Answer.find(params[:answer_id])
      vote.votable = answer
    else
      question = Question.find(params[:question_id])
      vote.votable = question
    end
    if vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

end
