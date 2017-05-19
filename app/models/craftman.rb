class Craftman < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :job
  has_many :workshops, dependent: :destroy
  has_many :bookings, through: :workshops
end
