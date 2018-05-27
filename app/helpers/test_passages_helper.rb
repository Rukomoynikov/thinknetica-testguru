module TestPassagesHelper
  def resule_message(test_passage)
    percent_of_correct_questions = (100 *  test_passage.correct_questions) / test_passage.test.questions.count

    if percent_of_correct_questions >= 85
      message = "<p class='color--green'>Вы прошли тест, ваш результат #{ percent_of_correct_questions }</p>"
    else 
      message = "<p class='color--red'>Тест не пройден, ваш результат #{ percent_of_correct_questions }</p>"
    end 

    message.html_safe
  end
end
