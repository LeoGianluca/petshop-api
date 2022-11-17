class City < ApplicationRecord
  has_one :state

  validates_presence_of :name
end
