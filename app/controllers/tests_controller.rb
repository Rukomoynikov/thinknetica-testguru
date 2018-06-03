class TestsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_test, only: [:show, :start]
  before_action :set_user, only: [:start]

  def index
    @tests = Test.all
  end

  def show; end

  def set_test
    @test = Test.find(params[:id])
  end

  def start
    @user.tests << @test

    redirect_to @user.test_passage(@test)
  end

  def set_user
    @user = User.first
  end
end
