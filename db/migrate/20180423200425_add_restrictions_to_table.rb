class AddRestrictionsToTable < ActiveRecord::Migration[5.2]
  def up
  	change_column :categories, :title, :string, null: false
  	change_column :categories, :title, :string, null: false

  	change_column :tests, :title, :string, null: false
  	change_column :tests, :level, :integer, null: false
  	change_column :tests, :category_id, :integer, null: false

  	change_column :questions, :body, :text, null: false
  	change_column :questions, :test_id, :integer, null: false

  	change_column :answers, :body, :text, null: false
  	change_column :answers, :correct, :boolean, null: false
  	change_column :answers, :question_id, :integer, null: false

  	change_column :users, :name, :string, null: false
  end

  def down

  end
end
