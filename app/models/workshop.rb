class Workshop < ApplicationRecord
  belongs_to :craftman
  has_many :messages
  has_many :bookings
end
