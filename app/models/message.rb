class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true

  after_create_commit { SendMessageJob.perform_later self }
end
