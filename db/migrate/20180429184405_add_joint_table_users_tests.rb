class AddJointTableUsersTests < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :tests
    add_column :tests_users, :id, :primary_key
  end
end
