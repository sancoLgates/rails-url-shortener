# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'sancolgates1@gmail.com' , password: 'test123' , password_confirmation: 'test123')
require 'faker'

100.times do
  Shorten.create([{ real_url: "#{Faker::Name.unique.first_name}.com"  }])
end