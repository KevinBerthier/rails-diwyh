class AddTotalPriceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_monetize :bookings, :total_price
  end
end
