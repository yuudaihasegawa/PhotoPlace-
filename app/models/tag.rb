# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :post_tags
end
