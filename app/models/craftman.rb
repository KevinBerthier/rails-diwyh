class Craftman < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :job, optional: true
  has_many :workshops, dependent: :destroy
  has_many :bookings, through: :workshops
  has_many :messages
  has_attachment :avatar
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :email, presence: true, email: true
end
