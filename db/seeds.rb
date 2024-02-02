# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
categories = ["chinese", "italian", "japanese", "french", "belgian"]

restaurants_data = [
  { name: "Restaurant 1", address: "Address 1", phone_number: "123-456-7890", category: "chinese" },
  { name: "Restaurant 2", address: "Address 2", phone_number: "123-456-7891", category: "italian" },
  { name: "Restaurant 3", address: "Address 3", phone_number: "123-456-7892", category: "japanese" },
  { name: "Restaurant 4", address: "Address 4", phone_number: "123-456-7893", category: "french" },
  { name: "Restaurant 5", address: "Address 5", phone_number: "123-456-7894", category: "belgian" }
]

#here we create or find existing categories based on the category names
categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

#here we create or find existing restaurants based on the restaurant names
restaurants_data.each do |attributes|
  restaurant = Restaurant.find_or_initialize_by(name: attributes[:name])
  restaurant.update!(attributes)
end

puts "You are a master"
