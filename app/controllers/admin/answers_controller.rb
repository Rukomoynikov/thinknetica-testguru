class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: [:new]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to admin_question_path(@answer.question), notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy

    redirect_to @answer.question
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:body, :question_id, :correct)
    end

    def find_question
      @question = Question.find(params[:question_id])
    end
end
