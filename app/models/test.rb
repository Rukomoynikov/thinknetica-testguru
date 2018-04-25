class Test < ApplicationRecord
  belongs_to :category

  def self.by_category(category)
  	query = "JOIN categories 
  					 ON tests.category_id = categories.id 
  					 WHERE categories.title = #{ category }"

  	self.joins(query).order('title desc')
  end
end
