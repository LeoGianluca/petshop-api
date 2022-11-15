module Payment
    class Base < ApplicationRecord
        self.table_name = "payments"

        has_one :service, dependent: :destroy

        validates_presence_of :service, :type, :status, :config

        enum status: { pending: 0, paid: 1, canceled: 2 }
    end
end
