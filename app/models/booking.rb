class Booking < ApplicationRecord
  belongs_to :workshop
  belongs_to :user
  has_one :review, dependent: :destroy
  has_one :craftman, through: :workshops
  enum status: [:submitted, :accepted, :rejected]

  monetize :total_price_cents
end
