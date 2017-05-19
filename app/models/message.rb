class Message < ApplicationRecord
  belongs_to :craftman
  belongs_to :workshop
  belongs_to :user
  enum author_type: [:user, :craftman]

  validates :content, presence: true
  validates :content, length: { maximum: 1000,
    too_long: "Your message is too long, please type a message with %{count} characters maximum " }
end
