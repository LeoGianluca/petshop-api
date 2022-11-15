module Payment
    class CreditPayment < Payment::Base
        store :config, accessors: [:installments], coder: JSON
    end
end
