class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, 
            :name,
            presence: true

  scope :finished_tests, -> {

  }

	# def finished_tests(level)
 #    Test.joins('join results on tests.id = results.test_id')
 #      .where("results.user_id = #{ self.id } and tests.level = #{ level }")
	# end
end
