class AddCodeToUniverses < ActiveRecord::Migration[5.1]
  def change
    add_column :universes, :code, :string
  end
end
