class FeedbackController < ApplicationController
  def new
  end

  def create
    FeedbackMailer.simple(feedback_params).deliver_now!

    flash[:notice] = t('.message_sent')
    
    redirect_to new_feedback_path
  end

  private

  def feedback_params
    params.permit(:sender_name, :feedback_body)
  end
end
