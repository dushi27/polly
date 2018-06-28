class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :survey_id
      t.string :choice_identifier

      t.timestamps
    end
  end
end
