class AddDefaultValueInTestPassages < ActiveRecord::Migration[5.2]
  def change
    change_column :tests_users, :correct_questions, :integer, default: 0
  end
end
