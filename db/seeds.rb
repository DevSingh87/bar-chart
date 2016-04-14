# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'
users = (1..5).to_a.map do |n|
 name = FFaker::Name.name
 email = FFaker::Internet.email
  User.create!(
    name:   name,
    email:  email
  )
end

products = (1..10).to_a.map do |n|
  name      = FFaker::Product.brand
  description = FFaker::Lorem.paragraph(30)
  Product.create!(
    name:  name,
    description: description
  )
  end

# Create Products
1000.times do |n|
  date = (rand*5).days.ago
  Like.create(
  	product: products[rand(products.size)], 
    user: users[rand(users.size)], 
    created_at: date
  )
end