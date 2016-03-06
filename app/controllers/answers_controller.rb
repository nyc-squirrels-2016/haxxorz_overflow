class AnswersController < ApplicationController
  def create

    @answer = Answer.new(body: params[:answer][:body], question_id: params[:question_id], user_id: current_user.id)
    if @answer.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  # private
  # def answer_params
  #   params.require(:answer).permit(:body)
  # end
end
