class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, 
            :name,
            presence: true

	def finished_tests(level)
    TestPassage
      .where(user: User.first, finished: true, 'tests.level': level)
      .includes(:test)
	end
end
