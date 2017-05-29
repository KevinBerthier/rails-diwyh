class AddCityToCraftmen < ActiveRecord::Migration[5.1]
  def change
    add_column :craftmen, :city, :string
  end
end
