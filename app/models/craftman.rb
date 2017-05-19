class Craftman < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :job, optional: true
  has_many :workshops, dependent: :destroy
  has_many :bookings, through: :workshops

  has_attachment :photo
end
