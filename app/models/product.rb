class Product < ApplicationRecord
    has_many :category_products
    has_many :categories, through: :category_products

    validates_presence_of :name, :price
end
