class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.integer :qualtrics_survey_id
      t.integer :qualtrics_response_id
      t.time :start_time
      t.time :end_time
      t.references :difficulty
      t.integer :score
      t.integer :number_of_questions
      t.timestamps
    end
  end
end
