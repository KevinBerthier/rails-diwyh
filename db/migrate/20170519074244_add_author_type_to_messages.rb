class AddAuthorTypeToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :author_types, :integer
  end
end
