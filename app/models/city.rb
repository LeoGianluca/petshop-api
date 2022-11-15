class City < ApplicationRecord
  has_one :state
  belongs_to :address

  validates_presence_of :name
end
