class AddSkillsToWorkshops < ActiveRecord::Migration[5.1]
  def change
    add_column :workshops, :skills, :string
  end
end
