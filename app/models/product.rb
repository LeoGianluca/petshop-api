class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :providers

    validates_presence_of :name, :price
end
