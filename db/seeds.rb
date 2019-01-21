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
User.create(first_name: "Allison", last_name: "Laird", email:"Allison@example.com", password: "1234")
User.create(first_name: "Joseph", last_name: "Laird", email:"Joseph@example.com", password: "1234")
User.create(first_name: "Judson", last_name: "Laird", email:"Judson@example.com", password: "1234")
User.create(first_name: "Riley", last_name: "Laird", email:"Riley@example.com", password: "1234")
User.create(first_name: "Justin", last_name: "Laird", email:"Justin@example.com", password: "1234", lat: 31.0982, long: 97.3428)

Meal.create(starts_at: Time.now, restaurant_name:"Test1", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )
Meal.create(starts_at: Time.now, restaurant_name:"Test2", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )
Meal.create(starts_at: Time.now, restaurant_name:"Test3", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )
Meal.create(starts_at: Time.now, restaurant_name:"Test4", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )
Meal.create(starts_at: Time.now, restaurant_name:"Test5", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )
Meal.create(starts_at: Time.now, restaurant_name:"Test6", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )
Meal.create(starts_at: Time.now, restaurant_name:"Test7", restaurant_phone:"123456", restaurant_address:"123 ABC Ln" )

Invite.create(meal_id: 4, sender_id: 1, receiver_id: 6, status: 'accepted')
Invite.create(meal_id: 4, sender_id: 4, receiver_id: 1, status: 'accepted')
Invite.create(meal_id: 4, sender_id: 4, receiver_id: 1, status: 'accepted')
Invite.create(meal_id: 6, sender_id: 1, receiver_id: 9, status: 'pending')
Invite.create(meal_id: 6, sender_id: 4, receiver_id: 8, status: 'pending')
Invite.create(meal_id: 7, sender_id: 4, receiver_id: 8, status: 'denied')