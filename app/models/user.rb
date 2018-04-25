class User < ApplicationRecord
	def finished_tests(level)
		query = "JOIN tests ON tests.id = results.test_id 
						 WHERE user_id = #{ self.id } and tests.level = #{ level }"
		Result.joins(query)
	end
end
