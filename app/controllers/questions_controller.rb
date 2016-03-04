class QuestionsController < ApplicationController
  def index
    @questions = Question.all.includes(:user).order(created_at: :desc)
  end

  def show
    @question = Question.includes(:user, :answers).find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
