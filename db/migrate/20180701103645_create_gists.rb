class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :question, foreign_key: true
      t.string :gist_hash

      t.timestamps
    end
  end
end
