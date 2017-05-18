class Booking < ApplicationRecord
  belongs_to :workshop
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
