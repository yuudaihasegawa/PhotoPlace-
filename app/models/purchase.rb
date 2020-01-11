# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
