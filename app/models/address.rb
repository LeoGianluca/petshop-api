class Address < ApplicationRecord
  belongs_to :city
  belongs_to :person, class_name: "Person::Base"
end
