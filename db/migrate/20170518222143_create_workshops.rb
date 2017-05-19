class CreateWorkshops < ActiveRecord::Migration[5.1]
  def change
    create_table :workshops do |t|
      t.string :title
      t.text :description
      t.references :craftman, foreign_key: true, index: true

      t.timestamps
    end
  end
end
