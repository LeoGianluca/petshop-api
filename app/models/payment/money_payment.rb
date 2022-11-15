module Payment
    class MoneyPayment < Payment::Base
        store :config, accessors: [:due_date, :payment_day], coder: JSON
    end
end
