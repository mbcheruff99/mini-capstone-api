# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

product = Product.create(
  name: "notebook",
  price: 1.5,
  description: "A subject purple spiral notebook, college ruled"
)

i = 1
5.times do
  Product.create(
    name: "Product #{i}",
    price: 2 + i,
    image_url: "image#{i}.jpeg",
    description: "product ##{i} is a good product"
  )
    i += 1
end