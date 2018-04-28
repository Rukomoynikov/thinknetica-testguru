class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def up
    add_column :tests, :author_id, :integer if !column_exists?(:tests, :author_id)
    add_foreign_key :tests, :users, column: 'author_id'
  end

  def down
  end
end
