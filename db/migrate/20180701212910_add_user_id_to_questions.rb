class AddUserIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user_id, :integer
    remove_column :questions, :survey_id
    remove_column :answers, :survey_id
  end
end
