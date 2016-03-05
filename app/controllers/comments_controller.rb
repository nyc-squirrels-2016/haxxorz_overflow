class CommentsController < ApplicationController
  def create
    comment = Comment.new(body: params[:comment][:body], user_id: current_user.id)
    question = Question.find(params[:question_id])
    comment.commentable = question
    if comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
