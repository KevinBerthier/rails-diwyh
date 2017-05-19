class Booking < ApplicationRecord
  belongs_to :workshop
  belongs_to :user
  has_many :reviews, dependent: :destroy
  enum status: [:submitted, :accepted, :rejected]
end
