# Create categories
Category.create!([
  { name: "Alimento" },
  { name: "Cosmético" },
  { name: "Remédio" }
])

# Create providers
Provider.create!([
  { name: "Pet Dist.LTDA", document: "12.345.678/0001-90" },
  { name: "Universo Pet", document: "15.583.658/0001-85" }
])

# Create products
Product.create!([
  { name: "Ração", price: 100.0, category_ids: 1, provider_ids: [1] },
  { name: "Sache", price: 80.0, category_ids: 1, provider_ids: [1]},
  { name: "Shampoo", price: 50.0, category_ids: [ 2, 3 ], provider_ids: [1] },
  { name: "Vermifugo", price: 20.0, category_ids: 3, provider_ids: [2] },
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

# Create states
State.create!([
  { name: "Minas Gerais" },
  { name: "São Paulo" }
])

# Create cities
City.create!([
  { name: "Belo Horizonte", state_id: 1 },
  { name: "Capelinha", state_id: 1 },
  { name: "São Paulo", state_id: 2 }
])

# Create people
  # Create client people
Person::ClientPerson.create!([
  { name: "José Maria", email: "jose@mail.com", document: "335.194.320-21", config: { type: "FISICA" } }
])
  # Create employee people
Person::EmployeePerson.create!([
  { name: "Maria José", email: "maria@mail.com", document: "551.872.200-12", config: { function: "SECRETARIA" } }
])

# Create addresses
Address.create!([
  { street: "Rua Tupis", number: "500", complement: "Apto 101", district: "Pindorama", zip_code: "30111222", city_id: 1, person_id: 1 },
  { street: "Rua Tamoios", number: "100", complement: "Casa", district: "Oca", zip_code: "30100333", city_id: 2, person_id: 2 },
  { street: "Rua Aranãs", number: "10", complement: "Apto 201", district: "Centro", zip_code: "3810033", city_id: 3, person_id: 2 }
])

# Create phones
Phone.create!([
  { number: "3516-2000", person_id: 1 },
  { number: "9191-0000", person_id: 1 },
  { number: "3279-0001", person_id: 2 },
  { number: "9090-0002", person_id: 2 }
])

# Create service
Service.create!([
  {
    entry_date: DateTime.parse("02/09/2021 09:00"),
    departure_date: DateTime.parse("02/09/2021 12:00"),
    description: "Tosa",
    pet_id: 1,
    person_ids: [1, 2],
  },
  {
    entry_date: DateTime.parse("03/09/2021 12:00"),
    departure_date: DateTime.parse("04/09/2021 12:00"),
    description: "Hotel",
    pet_id: 2,
    person_ids: [1, 2],
    product_ids: [1, 2, 4]
  },
  {
    entry_date: DateTime.parse("05/09/2021 16:00"),
    departure_date: DateTime.parse("05/09/2021 16:30"),
    description: "Vermifugação",
    pet_id: 3,
    product_ids: [3],
    person_ids: [1, 2]
  }
])

# Create payments
  # Create money payments
Payment::MoneyPayment.create!([
  {
    service_id: 2,
    type: "Payment::MoneyPayment",
    status: 0,
    config: {
      due_date: DateTime.parse("20/10/2017"), 
      payment_day: DateTime.parse("02/09/2021")
    }
  }
])

# Create card payments
Payment::CreditPayment.create!([
  {
    service_id: 1,
    type: "Payment::CreditPayment",
    status: 1,
    config: { installments: 6 }
  }
])
