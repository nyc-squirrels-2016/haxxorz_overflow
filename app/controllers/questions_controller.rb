class QuestionsController < ApplicationController
  def index
    @questions = Question.all.includes(:user).order(created_at: :desc)
  end

  def trending
    @questions = Question.sort_by_trending
  end

  def most_recent
    @questions = Question.sort_by_recent
  end

  def popular
    @questions = Question.sort_by_votes
  end

  def show
    @question = Question.includes(:user, :answers, :comments).find(params[:id])
    if logged_in?
      if current_user.id == @question.user_id
        @my_question = true
      else
        @my_question = false
      end
    end
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

  def make_best
    answer = Answer.find(params[:answer_id])
    question = Question.find(answer.question_id)
    question.update(best_answer_id: answer.id)
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
