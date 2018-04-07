class CreateDifficulties < ActiveRecord::Migration[5.1]
  def change
    create_table :difficulties do |t|
      t.integer :low
      t.integer :high
      t.timestamps
    end
  end
end
