class Message < ApplicationRecord
  belongs_to :craftman
  belongs_to :workshop
  belongs_to :user
  enum author_type: [:user, :craftman]

  validates :content, presence: true
  validates :content, length: { maximum: 1000,
    too_long: "Your message is too long, please type a message with %{count} characters maximum " }

  def user_left_right
    if self.author_type == "user"
      "right"
    else
      "left"
    end
  end

  def craftman_left_right
    if self.author_type == "craftman"
      "right"
    else
      "left"
    end
  end
end
