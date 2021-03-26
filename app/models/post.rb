class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_rich_text :concept
  has_many :comments, dependent: :destroy

  acts_as_taggable
  
  with_options presence: true do
    validates :title
    validates :concept
  end
  validates_length_of :concept, within: 50..300

end
