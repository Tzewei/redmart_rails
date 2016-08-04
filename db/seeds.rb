# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  productname = Faker::Beer.name
  price = Faker::Number.decimal(2)

  Product.create!(productname: productname,
                  price: price)
end

User.create!(name:  "admin",
             email: "admin@gmail.com",
             password:              "1234",
             password_confirmation: "1234",
             admin: true)

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

Review.create!( userreview: "Review 01 - this is review 01",
                user_id: 2,
                product_id: 1)

Review.create!( userreview: "Review 02 - this is review 02",
                user_id: 2,
                product_id: 2)
Review.create!( userreview: "Review 03 - this is review 03",
                user_id: 3,
                product_id: 1)

Review.create!( userreview: "Review 02 - this is review 01",
                user_id: 3,
                product_id: 2)
Review.create!( userreview: "Review 02 - this is review 01",
                user_id: 4,
                product_id: 1)
# 2.times do |n|
#   userreview = "Review 0#{n+1} - This is the review."
#   user_id = "#{n+1}"
#   product_id = "1"
#
#   Review.create!( userreview: userreview,
#                   user_id: user_id,
#                   product_id: product_id
#                   )
# end
