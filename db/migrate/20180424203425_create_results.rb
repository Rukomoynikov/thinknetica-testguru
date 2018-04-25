class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.belongs_to :test, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
