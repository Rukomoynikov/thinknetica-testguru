class TestsController < ApplicationController
  before_action :set_test, only: [:show, :start]

  def index
    @tests = Test.all
  end

  def show; end

  def set_test
    @test = Test.find(params[:id])
  end

  def start
    current_user.tests << @test

    send_starting_email

    redirect_to current_user.test_passage(@test)
  end

  private 

  def send_starting_email
    test_passage = current_user.test_passages.last

    TestsMailer.started_test(test_passage).deliver_now
  end
end
