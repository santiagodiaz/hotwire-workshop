# frozen_string_literal: true

class Product < ApplicationRecord
  enum status: { used: 0, brand_new: 1, other: 2 }
  belongs_to :category
  has_one_attached :picture
end
