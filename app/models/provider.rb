class Provider < ApplicationRecord
  validates_presence_of :name, :document

  # has_and_belongs_to_many :products
end
