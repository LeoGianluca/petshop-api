class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :type
      t.integer :status, default: 0
      t.json :config, default: {}

      t.timestamps
    end
  end
end
