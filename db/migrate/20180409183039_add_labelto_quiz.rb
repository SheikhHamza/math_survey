class AddLabeltoQuiz < ActiveRecord::Migration[5.1]
  def change
  	add_column :quizzes, :label, :string
  end
end
