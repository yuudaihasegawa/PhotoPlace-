# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { in: 1..30 }
  validates :introduction, length: { maximum: 150 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }


  
  attachment :profile_image


  has_many :comments ,dependent: :destroy
  has_many :favorites ,dependent: :destroy
  has_many :posts ,dependent: :destroy

  acts_as_paranoid
end
