class Job < ApplicationRecord
  belongs_to :universe
  has_many :craftmen, dependent: :destroy
  has_many :workshops, through: :craftmen

  JOBS = ["Vitrier", "Mosaïste"]

  validates :name, presence: true

  has_attachment :image

  validates :image, presence: true

end
