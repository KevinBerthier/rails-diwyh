class AddSecondDescriptionToUniverses < ActiveRecord::Migration[5.1]
  def change
    add_column :universes, :second_description, :text
  end
end
