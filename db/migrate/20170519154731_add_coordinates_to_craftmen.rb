class AddCoordinatesToCraftmen < ActiveRecord::Migration[5.1]
  def change
    add_column :craftmen, :latitude, :float
    add_column :craftmen, :longitude, :float
  end
end
