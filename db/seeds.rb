# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create categories
Category.create!([
  { name: "Alimento" },
  { name: "Cosmético" },
  { name: "Remédio" }
])

# Create products
Product.create!([
  { name: "Ração", price: 100.0, category_ids: 1 },
  { name: "Sache", price: 80.0, category_ids: 1 },
  { name: "Shampoo", price: 50.0, category_ids: [ 2, 3 ] },
  { name: "Vermifugo", price: 20.0, category_ids: 3 },
])



