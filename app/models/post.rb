class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :elements
  has_rich_text :concept
  has_many :comments

  acts_as_taggable
  
  with_options presence: true do
    validates :title
    validates :concept
    validates :image
  end

  scope :published, -> do
    where(published: true)
  end

  scope :most_recently_published, -> do
    order(published_at: :desc)
  end
end
