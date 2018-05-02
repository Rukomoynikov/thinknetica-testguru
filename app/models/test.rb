class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author

  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages


  scope :by_category, -> (category_name) { 
    self.joins(:category).where('categories.title': category_name)
  }

  scope :easy_level, -> { where level: 0..1 }
  scope :normal_level, -> { where level: 2..4 }
  scope :hard_level, -> { where level: 5..Float::INFINITY }
end
