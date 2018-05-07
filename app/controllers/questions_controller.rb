class QuestionsController < ApplicationController
  before_action :set_test, only: [:index, :new, :create]
  before_action :set_question, only: [:show, :delete]

  rescue_from ActiveRecord::RecordNotFound, 
              with: :rescue_with_question_not_found

  def index
    render 'questions/index', layout: false
  end

  def new; end

  def create
    @test.questions.create question_params

    redirect_to test_questions_path(@test)
  end

  def show; end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@test)
  end

  private 

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
