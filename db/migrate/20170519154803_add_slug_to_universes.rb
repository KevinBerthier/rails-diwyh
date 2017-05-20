class AddSlugToUniverses < ActiveRecord::Migration[5.1]
  def change
    add_column :universes, :slug, :string
  end
end
