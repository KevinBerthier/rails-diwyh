class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true
  validates :rating, numericality: true
  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :description, presence: true
  validates :description, length: { maximum: 300,
    too_long: "Your post is too long, please type a text with %{count} characters maximum " }
end
