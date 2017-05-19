class Booking < ApplicationRecord
  belongs_to :workshop
  belongs_to :user
  has_one :review, dependent: :destroy
  has_one :craftman, through: :workshops
  enum status: [:submitted, :accepted, :rejected]

  monetize :total_price_cents

  validates :date_check_in, presence: true
  validates :date_check_out, presence: true

end
