class FeedbackMailer < ApplicationMailer
  def simple(message)
    @message = message
    
    mail to: Admin.first, subject: 'Feedback from TestGuru Site'
  end
end
