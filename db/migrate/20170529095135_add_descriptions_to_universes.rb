class AddDescriptionsToUniverses < ActiveRecord::Migration[5.1]
  def change
    add_column :universes, :third_description, :text
    add_column :universes, :fourth_description, :text
  end
end
