class MoveRestultsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    drop_table :results
    add_column :tests_users, :finished, :boolean
  end
end
