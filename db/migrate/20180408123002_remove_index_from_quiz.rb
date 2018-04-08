class RemoveIndexFromQuiz < ActiveRecord::Migration[5.1]
  def change
  	remove_index :quizzes, name: 'index_quizzes_on_difficulty_id' 
  end
end
