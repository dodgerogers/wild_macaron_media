# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.transaction do
  User.create!(email: "estherraday@gmail.com", password: "Shiny!0!", password_confirmation: "Shiny!0!", admin: true)
  User.create!(email: "andrewrogers747@hotmail.com", password: "Azonic123", password_confirmation: "Azonic123", admin: true)
end