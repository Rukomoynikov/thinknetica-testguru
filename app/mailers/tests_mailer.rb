class TestsMailer < ApplicationMailer
  def started_test(test_passage)
    extract_info(test_passage)
    mail to: @user.email, subject: 'You started the TestGuru test!'    
  end

  def completed_test(test_passage)
    extract_info(test_passage)
    mail to: @user.email, subject: 'You completed the TestGuru test!'
  end

  private

  def extract_info(test_passage)
    @user = test_passage.user
    @test = test_passage.test
  end
end
