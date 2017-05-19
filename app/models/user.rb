class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages, dependent: :destroy
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, email: true
end
