module Payment
    class Base < ApplicationRecord
        self.table_name = "payments"

        has_one :service

        validates_presence_of :type, :status, :config

        enum status: { pending: 0, paid: 1, canceled: 2 }
    end
end
