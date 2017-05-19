class Workshop < ApplicationRecord
  belongs_to :craftman
  has_many :messages, dependent: :nullify
  has_many :bookings

  monetize :price_cents

  has_attachments :photos, maximum: 10
end
