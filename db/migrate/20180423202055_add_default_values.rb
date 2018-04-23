class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
  	change_column :tests, :level, :integer, null: false, default: 1
  	change_column :answers, :correct, :boolean, null: false, default: false
  end
end
