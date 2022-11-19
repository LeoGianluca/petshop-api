class Phone < ApplicationRecord
  belongs_to :person, class_name: "Person::Base"
end
