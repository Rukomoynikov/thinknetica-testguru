module TestPassagesHelper
  def resule_message(test_passage)
    message = if test_passage.success?
      "<p class='color--green'>Вы прошли тест, ваш результат #{ percent_of_correct_questions }</p>"
    else 
      "<p class='color--red'>Тест не пройден, ваш результат #{ percent_of_correct_questions }</p>"
    end 

    message.html_safe
  end

  def question_number(test_passage)
    test_passage.test.questions.find_index { |question| question.id == test_passage.current_question.id } + 1
  end
end
