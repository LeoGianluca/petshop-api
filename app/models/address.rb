class Address < ApplicationRecord
  has_one :city
  has_one :person
end
