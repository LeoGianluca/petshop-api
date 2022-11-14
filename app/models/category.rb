class Category < ApplicationRecord
    has_many :category_products
    has_many :products, through: :category_products

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
