# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do |n|
  name = Faker::Name.name
  email = "trainee-#{n+1}@gmail.com"
  gender = "1"
  password = "123456"
  password_confirmation = "123456"
  User.create!(name: name, email: email,  password: password,
               password_confirmation: password_confirmation, role: 0)
end
