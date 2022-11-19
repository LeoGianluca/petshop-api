class Category < ApplicationRecord
    has_and_belongs_to_many :products

    validates_presence_of :name

    def format_products()
        {
        id: self.id,
            name: self.name,
            products: self.products.map do |product|
                {
                    id: product.id,
                    name: product.name,
                    price: product.price
                }
            end
        }
    end
end
