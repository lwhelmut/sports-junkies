class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_rich_text :concept

  has_many :comments, dependent: :destroy

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  acts_as_taggable
  
  with_options presence: true do
    validates :title
    validates :concept
  end
  validates_length_of :concept, within: 50..300

end
