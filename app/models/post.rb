# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :post_images
  has_many :post_tags
  has_many :favorites
  has_many :comments
  has_many :purchases

  accepts_nested_attributes_for :post_images, allow_destroy: true
  accepts_nested_attributes_for :post_tags, allow_destroy: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
