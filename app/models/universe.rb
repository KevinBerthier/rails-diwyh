class Universe < ApplicationRecord
  has_many :jobs, dependent: :destroy
  has_many :craftmen, through: :jobs
  #test
  #has_many :workshops, through: :jobs, through: :craftmen

  extend FriendlyId
  friendly_id :code, use: :slugged

  validates :name, presence: true

  has_attachment :photo
end
