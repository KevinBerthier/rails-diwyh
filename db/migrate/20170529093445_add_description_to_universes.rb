class AddDescriptionToUniverses < ActiveRecord::Migration[5.1]
  def change
    add_column :universes, :description, :text
  end
end
