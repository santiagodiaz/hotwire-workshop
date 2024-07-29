# frozen_string_literal: true

FactoryBot.define do
  factory :shipping_address do
    country { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    line1 { 'MyString' }
    line2 { 'MyString' }
    postal_code { 'MyString' }
    order { nil }
  end
end
