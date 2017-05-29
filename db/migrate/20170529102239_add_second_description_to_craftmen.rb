class AddSecondDescriptionToCraftmen < ActiveRecord::Migration[5.1]
  def change
    add_column :craftmen, :second_description, :text
  end
end
