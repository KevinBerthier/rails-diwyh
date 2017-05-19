class Workshop < ApplicationRecord
  belongs_to :craftman
  has_many :messages, dependent: :nullify
  has_many :bookings

  monetize :price_cents,
  :numericality => {
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 100000
  }

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
