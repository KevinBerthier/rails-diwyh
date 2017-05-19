class AddPriceToWorkshops < ActiveRecord::Migration[5.1]
  def change
    add_monetize :workshops, :price, currency: { present: false }
  end
end
