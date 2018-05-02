class TestPassage < ApplicationRecord
  self.table_name = 'tests_users'

  belongs_to :user
  belongs_to :test
end
