class Post < ApplicationRecord
  
  belongs_to :user

  has_many :post_images
  has_many :post_tags
  has_many :favorites
  has_many :comments
  has_many :purchases
  has_many :post_tags 

  validates :title, length: { in: 1..30 }
  validates :content, length: { in: 1..150 }
  validates :address, length: { in: 1..50 }
  # validates_associated :images
  # validates :image_id, presence: true

  accepts_nested_attributes_for :post_images, allow_destroy: true
  accepts_nested_attributes_for :post_tags, allow_destroy: true

  geocoded_by :address, latitude: :latitude, longitude: :longitude
  after_validation :geocode

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  acts_as_paranoid
end

