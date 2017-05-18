class Universe < ApplicationRecord
  has_many :jobs, dependent: :destroy
  has_many :craftmen, through: :jobs
end
