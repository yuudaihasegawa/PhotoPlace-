# frozen_string_literal: true

class Tag < ApplicationRecord

  has_many :post_tags ,dependent: :destroy
  has_many :post, through: :post_tags
  

  # validates :name, length: { in: 1..30 }
  
  acts_as_paranoid


end
