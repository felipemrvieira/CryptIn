# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "Felipe Maciel", email: "felipemrvieira@gmail.com", password: "123123", password_confirmation: "123123")
Account.create(ballance: 1000, user_id: User.first.id)
Transition.create(amount: 350, account_id: Account.first.id)