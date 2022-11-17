class Service < ApplicationRecord
    has_one :payment, dependent: :destroy
    has_many :service_products, dependent: :destroy
    has_many :products, through: :service_products
    belongs_to :person

    validates_presence_of :entry_date, :departure_date, :description
end
