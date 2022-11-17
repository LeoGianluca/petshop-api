class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :type
      t.integer :status, default: 0
      t.json :config, default: {}
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
