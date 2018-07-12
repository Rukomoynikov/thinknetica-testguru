class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: [:index, :update_inline]
  before_action :set_test, only: [:show, :start, :edit, :update_inline]

  def index; end

  def new
    @test = Test.new
    @test.author = current_user
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def create
    @test = current_user.created_tests.new(test_params)
    
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update
    test = Test.new(test_params)

    if test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def edit
  end

  def show; end

  def set_test
    @test = Test.find(params[:id])
  end

  private 

  def send_starting_email
    test_passage = current_user.test_passages.last

    TestsMailer.started_test(test_passage).deliver_now
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end

  def set_tests
    @tests = Test.all
  end
end
