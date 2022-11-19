class CreateJoinTableProviderProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :providers, :products do |t|
      t.index [:provider_id, :product_id]
      # t.index [:product_id, :provider_id]
    end
  end
end
