class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, 
            :name,
            presence: true

  validates :email, uniqueness: true
  validates :email, format: /.+@.+\..{2,4}/

  has_secure_password
  
	def finished_tests(level)
    TestPassage
      .where(user: User.first, finished: true, 'tests.level': level)
      .includes(:test)
  end
  
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
