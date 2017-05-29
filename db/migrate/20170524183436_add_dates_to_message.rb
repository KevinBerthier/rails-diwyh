class AddDatesToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :date_checkin, :date
    add_column :messages, :date_checkout, :date
  end
end
