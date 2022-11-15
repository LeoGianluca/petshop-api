class Species < ApplicationRecord
    has_many :pets

    validates_presence_of :description
end
