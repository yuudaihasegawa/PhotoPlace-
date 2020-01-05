class Post < ApplicationRecord
  has_many :post_images
  has_many :post_tags
  has_many :maps
  has_many :favorites
  has_many :comments
  has_many :purchases
end

