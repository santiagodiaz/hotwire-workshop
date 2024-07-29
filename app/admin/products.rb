# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :description, :unit_price, :status, :stock, :category_id, :picture

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :description
      f.input :unit_price
      f.input :status
      f.input :stock
      f.input :picture, as: :file
    end

    f.actions

    div image_tag @resource.picture if @resource.picture.attached?
  end

  filter :id
end
