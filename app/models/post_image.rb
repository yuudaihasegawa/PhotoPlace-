# frozen_string_literal: true

class PostImage < ApplicationRecord
  belongs_to :post

  attachment :image
  validates :image, presence: true
  
  acts_as_paranoid
end
