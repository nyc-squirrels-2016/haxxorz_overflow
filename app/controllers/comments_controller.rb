class CommentsController < ApplicationController
  def create
    comment = Comment.new(body: params[:comment][:body], user_id: current_user.id)
    if params.include?(:answer_id)
      answer = Answer.find(params[:answer_id])
      comment.commentable = answer
    else
      question = Question.find(params[:question_id])
      comment.commentable = question
    end
    if comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
