class AnswersController < ApplicationController

    def create
      @question = Question.find(params[:question_id])
      @answer = Answer.new(answer_params)
      @answer.question = @question

      if @answer.save
        flash[:notice] = "Answer saved successfully."
        redirect_to question_path(@question)
      else
        flash[:notice] = "Failed to save answer."
        redirect_to question_path(@question)
      end
    end

    def answer_params
      params.require(:answer).permit(:description)
    end

end
