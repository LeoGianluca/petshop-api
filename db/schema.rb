# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_19_135342) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "district"
    t.string "zip_code"
    t.bigint "city_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["person_id"], name: "index_addresses_on_person_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "product_id", null: false
    t.index ["category_id", "product_id"], name: "index_categories_products_on_category_id_and_product_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.integer "status", default: 0
    t.json "config", default: {}
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_payments_on_service_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "document"
    t.string "type"
    t.json "config"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_services", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "service_id", null: false
    t.index ["person_id", "service_id"], name: "index_people_services_on_person_id_and_service_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.bigint "species_id", null: false
    t.bigint "breed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_pets_on_breed_id"
    t.index ["species_id"], name: "index_pets_on_species_id"
  end

  create_table "pets_services", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "pet_id", null: false
    t.index ["service_id", "pet_id"], name: "index_pets_services_on_service_id_and_pet_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_phones_on_person_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_providers", id: false, force: :cascade do |t|
    t.bigint "provider_id", null: false
    t.bigint "product_id", null: false
    t.index ["provider_id", "product_id"], name: "index_products_providers_on_provider_id_and_product_id"
  end

  create_table "products_services", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "product_id", null: false
    t.index ["service_id", "product_id"], name: "index_products_services_on_service_id_and_product_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.datetime "entry_date"
    t.datetime "departure_date"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pet_id"
    t.index ["pet_id"], name: "index_services_on_pet_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "people"
  add_foreign_key "cities", "states"
  add_foreign_key "payments", "services"
  add_foreign_key "pets", "breeds"
  add_foreign_key "pets", "species"
  add_foreign_key "phones", "people"
  add_foreign_key "services", "pets"
end
