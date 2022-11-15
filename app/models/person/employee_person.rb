module Person
    class EmployeePerson < Person::Base
        store :config, accessors: [:function], coder: JSON
    end
end
