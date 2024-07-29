# Generate model files based on the schema
puts 'Generating models...'

# Category model
rails_command 'generate model Category name:string description:text'

# ShoppingCart model
rails_command 'generate model ShoppingCart user:references'

# Product model
rails_command 'generate model Product name:string description:text unit_price:decimal status:integer stock:integer category:references picture:attachment'

# Order model
rails_command 'generate model Order user:references total_price:decimal'

# LineItem model
rails_command 'generate model LineItem shopping_cart:references product:references order:references quantity:integer unit_price:decimal total_price:decimal'

# ShippingAddress model
rails_command 'generate model ShippingAddress country:string city:string state:string line1:string line2:string postal_code:string order:references'

rails_command 'db:migrate'

puts 'Models generated successfully!'

# Define the admin directory
admin_dir = 'app/admin'

# Ensure the admin directory exists
unless Dir.exist?(admin_dir)
  puts "Creating directory #{admin_dir}"
  FileUtils.mkdir_p(admin_dir)
end

# Create the Category admin file
create_file "#{admin_dir}/categories.rb" do
  <<-RUBY
  ActiveAdmin.register Category do
    permit_params :name

    filter :id
  end
  RUBY
end

# Create the Product admin file
create_file "#{admin_dir}/products.rb" do
  <<-RUBY
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
  RUBY
end

insert_into_file 'app/models/application_record.rb', after: "include Ransackable\n" do
  <<-RUBY
  RANSACK_ATTRIBUTES = ['id'].freeze
  RUBY
end

insert_into_file 'app/models/product.rb', after: "class Product < ApplicationRecord\n" do
  <<-RUBY
  enum status: { used: 0, brand_new: 1, other: 2 }
  RUBY
end

puts 'Active Admin views have been generated.'
