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

        def format_person_all_data()
            {
                id: self.id,
                name: self.name,
                email: self.email,
                document: self.document,
                phones: Phone.where(person_id: self.id).map do |phone|
                    {
                        phone: phone.number
                    }
                end,
                address: Address.where(person_id: self.id).map do |address|
                    {
                        zip_code: address.zip_code,
                        street: address.street,
                        number: address.number,
                        complement: address.complement,
                        district: address.district,
                        city: address.city.name,
                        state: address.city.state.name
                    }
                end
            }
        end
    end
end
