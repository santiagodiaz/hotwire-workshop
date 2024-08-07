# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    shopping_cart { nil }
    product { nil }
    order { nil }
    quantity { 1 }
    unit_price { '9.99' }
    total_price { '9.99' }
  end
end
