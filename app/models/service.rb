class Service < ApplicationRecord
    has_one :payment, dependent: :destroy
    belongs_to :pet

    has_and_belongs_to_many :people, class_name: "Person::Base", association_foreign_key: "person_id"
    has_and_belongs_to_many :products

    validates_presence_of :entry_date, :departure_date, :description
end
