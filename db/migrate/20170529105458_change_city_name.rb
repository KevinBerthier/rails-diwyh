class ChangeCityName < ActiveRecord::Migration[5.1]
  def change
    rename_column :craftmen, :city, :locality
  end
end
