module Person
    class Base < ApplicationRecord
        self.table_name = "people"

        belongs_to :address
        belongs_to :phone

        validates_presence_of :name, :email, :document
    end
end
