class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :gists
  has_many :tests, through: :test_passages
  has_many :created_tests, 
    class_name: "Test", 
    foreign_key: "author_id",
    dependent: :destroy

  validates :email, presence: true

  validates :email, uniqueness: true, format: /.+@.+\..{2,4}/

	def finished_tests(level)
    TestPassage
      .where(user: User.first, finished: true, 'tests.level': level)
      .includes(:test)
  end
  
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
