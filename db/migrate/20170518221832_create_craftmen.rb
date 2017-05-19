class CreateCraftmen < ActiveRecord::Migration[5.1]
  def change
    create_table :craftmen do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.text :description
      t.date :birth_date
      t.references :job, foreign_key: true, index: true

      t.timestamps
    end
  end
end
