# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


Order.destroy_all
Formation.destroy_all
User.destroy_all
Cart.destroy_all
LineItem.destroy_all



#Create 10 random formation 
10.times do
  picsum_id = rand(1..1000)
  Formation.create(
    user_id: User.all.sample.id,
    name: Faker::Book.title,
    description: Faker::Quote.most_interesting_man_in_the_world,
    price: rand(10..5000),
    picture_url: "https://picsum.photos/id/#{picsum_id}/600/600",
    categorie: Faker::Hacker.adjective,
    sale: Date.today,
    tag: Faker::Hacker.adjective
    )
  end
puts "10 formations created"



#Create 9 random users 
9.times do 
  User.create!(
  email: Faker::Internet.email,
  password: "azerty",
  is_admin: Faker::Boolean.boolean,
  username: Faker::FunnyName.name,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  bio: Faker::Lorem.sentence,
  dateofbirth: Faker::Date.birthday(min_age: 18, max_age: 65),
  siret: Faker::Number.number(digits: 5),
  adress: Faker::Address.street_address,
  zipcode: Faker::Address.zip_code, city: Faker::Address.city,
  country: Faker::Address.country, 
  mobile: Faker::PhoneNumber.phone_number,
  fb_user_ID: Faker::Number.number(digits: 5),
  insta_user_ID: Faker::Number.number(digits: 5)
  )
  end
puts "9 users were created"