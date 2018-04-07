class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :quiz, foreign_key: true
      t.integer :number_one
      t.integer :number_two
      t.integer :number_three
      t.integer :response
      t.integer :solution
      t.timestamps
    end
  end
end
