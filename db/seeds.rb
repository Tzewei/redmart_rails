# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |n|
  # productname = Faker::Vehicle.manufacture
  productname = Faker::Beer.name
  price = Faker::Number.decimal(2)

  Product.create!(productname: productname,
                  price: price)
end

5.times do |n|
  name = Faker::StarWars.character
  email = "test#{n+1}@gmail.com"
  address = Faker::Address.street_address
  password = "1234"

  User.create!( name: name,
                email: email,
                address: address,
                password: password,
                password_confirmation: password)

end
