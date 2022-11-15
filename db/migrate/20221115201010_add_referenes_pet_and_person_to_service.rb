class AddReferenesPetAndPersonToService < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :pet, null: false, foreign_key: true
    add_reference :services, :people, null: false, foreign_key: true
  end
end
