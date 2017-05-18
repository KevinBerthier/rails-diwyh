class Craftman < ApplicationRecord
  belongs_to :job
  has_many :workshops, dependent: :destroy
  has_many :bookings, through: :workshops
end
