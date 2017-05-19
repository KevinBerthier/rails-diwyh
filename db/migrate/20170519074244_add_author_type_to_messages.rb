class AddAuthorTypeToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :author_type, :integer
  end
end
