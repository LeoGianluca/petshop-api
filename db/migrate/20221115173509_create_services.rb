class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.datetime :entry_date
      t.datetime :departure_date
      t.string :description

      t.timestamps
    end
  end
end
