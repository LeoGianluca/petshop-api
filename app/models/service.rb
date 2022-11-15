class Service < ApplicationRecord
    has_one :payment, dependent: :destroy

    validates_presence_of :entry_date, :departure_date, :description
end
