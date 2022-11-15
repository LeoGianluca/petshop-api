module Person
    class ClientPerson < Person::Base
        store :config, accessors: [:type], coder: JSON
    end
end
