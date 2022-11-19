class AddReferencesPetToService < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :pet, null: true, foreign_key: true
  end
end
