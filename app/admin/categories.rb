  ActiveAdmin.register Category do
    permit_params :name

    filter :id
  end
