class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

	def finished_tests(level)
    Test.joins('join results on tests.id = results.test_id')
      .where("results.user_id = #{ self.id } and tests.level = #{ level }")
	end
end
