# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Meal.destroy_all
Invite.destroy_all

User.create(first_name: "Jordan", last_name: "Laird", email:"Jordan@example.com", password: "1234")
User.create(first_name: "Amber", last_name: "Laird", email:"Amber@example.com", password: "1234")
User.create(first_name: "Joe", last_name: "Laird", email:"Joe@example.com", password: "1234")

Meal.create(starts_at: Time.now, restaurant_name:"Test1", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )
Meal.create(starts_at: Time.now, restaurant_name:"Test2", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )
Meal.create(starts_at: Time.now, restaurant_name:"Test3", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )