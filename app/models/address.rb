class Address < ApplicationRecord
  has_one :city
  has_one :person, class_name: "Person::Base"
end
