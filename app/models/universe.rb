class Universe < ApplicationRecord
  has_many :jobs, dependent: :destroy
  has_many :craftmen, through: :jobs
  #test
  has_many :workshops, through: :jobs, through: :craftmen

  extend FriendlyId
  friendly_id :code, use: :slugged

  validates :name, presence: true

  has_attachment :banner
  has_attachment :top_gallery
  has_attachments :middle_gallery, maximum: 2
  has_attachments :gallery, maximum: 3
  has_attachment :artisan_profile
  has_attachment :artisan_hands

  validates :banner, presence: true
  validates :top_gallery, presence: true
  validates :middle_gallery, presence: true
  validates :gallery, presence: true
  validates :artisan_profile, presence: true
  validates :artisan_hands, presence: true
end
