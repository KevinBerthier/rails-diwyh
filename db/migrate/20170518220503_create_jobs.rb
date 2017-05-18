class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.references :universe, foreign_key: true, index: true

      t.timestamps
    end
  end
end
