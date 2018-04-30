class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author

  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.by_category(category)
    query = "JOIN categories ON tests.category_id = categories.id WHERE categories.title = #{ category }"

    self.joins(query).order('title desc').pluck(:title)
  end
end
