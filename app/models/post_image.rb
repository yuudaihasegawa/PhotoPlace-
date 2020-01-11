# frozen_string_literal: true

class PostImage < ApplicationRecord
  belongs_to :post

  attachment :image
end
