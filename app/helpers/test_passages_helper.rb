module TestPassagesHelper
  def result_message(test_passage)
    percent_of_correct_questions = (100 *  test_passage.correct_questions) / test_passage.test.questions.count

    message = if test_passage.success?
      "<p class='color--green'>#{t('.success_message', percent: percent_of_correct_questions )}</p>"
    else 
      "<p class='color--red'>#{t('.fail_message', percent: percent_of_correct_questions )}</p>"
    end 

    message.html_safe
  end

  def question_number(test_passage)
    test_passage.test.questions.find_index { |question| question.id == test_passage.current_question.id } + 1
  end
end
