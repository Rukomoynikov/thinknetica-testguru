class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :update, :result, :gist]
  
  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    gist_link = result.html_url

    gist_params = { 
      question: @test_passage.current_question, 
      user: current_user,
      gist_hash: result.id
    }

    current_user.gists.create gist_params

    flash_options = if result.html_url.present?
      { notice: t('.success', gist_link: gist_link)}
    else
      { alert: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
