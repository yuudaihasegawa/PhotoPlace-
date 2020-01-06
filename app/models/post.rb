class Post < ApplicationRecord
  has_many :post_images
  has_many :post_tags
  has_many :maps
  has_many :favorites
  has_many :comments
  has_many :purchases

  accepts_nested_attributes_for :post_images, allow_destroy: true
  accepts_nested_attributes_for :maps, allow_destroy: true
end

