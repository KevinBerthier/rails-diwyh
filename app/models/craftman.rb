class Craftman < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :job
  has_many :workshops, dependent: :destroy
  has_many :bookings, through: :workshops

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :email, presence: true, email: true
end
