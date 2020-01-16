class PostImage < ApplicationRecord
  belongs_to :post

  validates :image_id, presence: true

  attachment :image
  
  acts_as_paranoid
end
