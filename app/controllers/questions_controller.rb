class QuestionsController < ApplicationController

  def index
    @questions = Question.order("created_at DESC").all
    @question = Question.new
    @answer = Answer.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order("created_at DESC")
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "You saved a question."
      redirect_to questions_path
    else
      flash[:notice] = "Did not save Question."
      render "new"
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(
      :title,
      :description
    )
  end
end
