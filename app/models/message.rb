class Message < ApplicationRecord
  belongs_to :craftman
  belongs_to :workshop
  belongs_to :user
  enum author_type: [:user, :craftman]
end
