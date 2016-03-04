class QuestionsController < ApplicationController
  def index
    @questions = Question.all.includes(:user).order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id]).includes(:user)
  end
end
