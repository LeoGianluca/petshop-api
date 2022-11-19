class CreateJoinTableServiceProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :services, :products do |t|
      t.index [:service_id, :product_id]
      # t.index [:product_id, :service_id]
    end
  end
end
