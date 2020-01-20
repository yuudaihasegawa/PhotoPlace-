class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { in: 1..30 }
  # validates :introduction, length: { in: 0..150 }
  

  attachment :profile_image


  has_many :comments
  has_many :favorites
  has_many :posts
  
  acts_as_paranoid
end
