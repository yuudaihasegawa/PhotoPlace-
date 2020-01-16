class Tag < ApplicationRecord
  has_many :post_tags
  
  validates :name, length: { in: 1..30 }
  
  acts_as_paranoid

end
