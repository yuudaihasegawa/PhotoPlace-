class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, length: { in: 1..30 }
  validates :introduction, 

  attachment :profile_image

  has_many :chages
  has_many :comments
  has_many :favorites
  has_many :purchases
  has_many :posts
  
  acts_as_paranoid
end
