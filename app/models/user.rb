class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments, dependent: :destroy

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  has_many :likes

  acts_as_taggable

  with_options presence: true do
    validates :name
    validates :favorite_sports
  end
  validates :age, presence: true, numericality: true 
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end
