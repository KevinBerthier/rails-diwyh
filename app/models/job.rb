class Job < ApplicationRecord
  belongs_to :universe
  has_many :craftmen, dependent: :destroy
  has_many :workshops, through: :craftmen

  validates :name, presence: true
end
