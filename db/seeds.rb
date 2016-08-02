# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# seeds.rb is a way of automating the population of the database with testing data.

# (0..10).each do |i|
#     product.create!(
#       productname: Faker::Vehicle.manufacture,
#       price: Faker::Number.decimal(2)
#     )
# end
#
#
#
#
# (0..5).each do |i|
#     user.create!(
#       name: Faker::StarWars.character,
#       email: Faker::Internet.email,
#       address: Faker::Address.street_address
#     )
# end
50.times do |n|
  # productname = Faker::Vehicle.manufacture
  productname = Faker::Beer.name
  price = Faker::Number.decimal(2)

  Product.create!(productname: productname,
                  price: price)
end

# 5.times do |n|
#   name = Faker::StarWars.character
#   email = "test#{n+1}@gmail.com"
#   address = Faker::Address.street_address
#
#
#   User.create!( name: name,
#                 email: email,
#                 address: address,
#
# end
