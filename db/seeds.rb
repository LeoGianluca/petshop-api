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

# Create species
Species.create!([
  { description: "Cachorro" },
  { description: "Gato" }
])

# Create breeds
Breed.create!([
  { description: "Shitzu" },
  { description: "Akita" },
  { description: "Persa" }
])

# Create pets
Pet.create!([
  { name: "Jhon", age: 6, species_id: 1, breed_id: 1 },
  { name: "Hana", age: 5, species_id: 1, breed_id: 2 },
  { name: "Mewth", age: 8, species_id: 2, breed_id: 3 },
])

