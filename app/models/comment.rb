# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :content, length: { in: 1..75 }
  acts_as_paranoid
end
