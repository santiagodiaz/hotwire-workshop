# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'MyString' }
    description { 'MyText' }
    unit_price { '9.99' }
    status { 1 }
    stock { 1 }
    category { nil }
    picture { nil }
  end
end
