class Answer < ApplicationRecord
  belongs_to :question

  validates :body, 
            :correct,
            :question_id,
            presence: true

  scope :correct, -> { where correct: true }
end
