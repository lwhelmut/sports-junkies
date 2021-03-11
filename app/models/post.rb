class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  acts_as_ordered_taggable
  
  with_options presence: true do
    validates :title
    validates :concept
    validates :image
  end
end
