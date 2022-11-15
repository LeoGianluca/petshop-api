class Pet < ApplicationRecord
  has_one :species
  has_one :breed

  validates_presence_of :name, :age
  validates :age, numericality: { only_integer: true, greater_than: 0 }
end
