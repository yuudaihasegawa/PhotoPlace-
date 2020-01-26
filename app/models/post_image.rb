class PostImage < ApplicationRecord
  belongs_to :post

  attachment :image
  
  acts_as_paranoid
end
