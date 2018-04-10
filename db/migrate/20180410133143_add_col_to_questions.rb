class AddColToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :qualtrics_survey_id, :string
    add_column :questions, :qualtrics_response_id, :string
    add_column :questions, :seconds_taken, :integer
  end
end
