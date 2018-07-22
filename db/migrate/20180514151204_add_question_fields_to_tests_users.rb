class AddQuestionFieldsToTestsUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests_users, :current_question, foreign_key: { to_table: :questions }
    add_column :tests_users, :correct_questions, :integer
  end
end
