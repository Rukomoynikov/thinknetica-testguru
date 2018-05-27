class TestPassage < ApplicationRecord
  self.table_name = 'tests_users'

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, 
              class_name: 'Question', 
              optional: true

  before_validation :before_validation_set_first, on: :create
  after_validation :after_update_set_next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_first
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count  == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def after_update_set_next_question
    self.current_question = test
                      .questions
                      .order(:id)
                      .where('id > ?', self.current_question.id )
                      .first
  end
end
