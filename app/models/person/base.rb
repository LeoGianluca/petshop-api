module Person
    class Base < ApplicationRecord
        self.table_name = "people"

        validates_presence_of :name, :email, :document

        def format_person()
            {
                id: self.id,
                name: self.name,
                email: self.email,
            }
        end
    end
end
