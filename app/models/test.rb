class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author

  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages


  scope :by_category, -> (category_name) { 
    self.joins(:category)
        .where('categories.title': category_name)
  }

  scope :easy_level, -> { where level: 0..1 }
  scope :normal_level, -> { where level: 2..4 }
  scope :hard_level, -> { where level: 5..Float::INFINITY }

  validates :title, 
            :level,
            :category_id,
            :author_id,
            presence: true

  validates :level,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }

  validates :title,
            uniqueness: { scope: :level }

  def self.titles_by_category(category)   
    query = "JOIN categories ON tests.category_id = categories.id WHERE categories.title = #{ category }"   
          
    self.joins(query).order('title desc').pluck(:title)
  end
end
