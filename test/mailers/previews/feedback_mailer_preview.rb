# Preview all emails at http://localhost:3000/rails/mailers/feedback_mailer
class FeedbackMailerPreview < ActionMailer::Preview
  def simple
    FeedbackMailer.simple sender_name: 'Maksim', feedback_body: 'Hi!'
  end
end
