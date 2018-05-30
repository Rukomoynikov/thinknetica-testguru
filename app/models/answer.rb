class Answer < ApplicationRecord
  belongs_to :question

  validates :body, 
            :question_id,
            presence: true

  scope :correct, -> { where correct: true }

  validate :validate_answers_in_question_count

  def validate_answers_in_question_count
    errors.add(:question, 'Already filled with answers') if self.question.answers.count >= 4
  end
end
