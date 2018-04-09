class AddLabletoDifficulty < ActiveRecord::Migration[5.1]
  def change
  	add_column :difficulties, :label, :string
  end
end
