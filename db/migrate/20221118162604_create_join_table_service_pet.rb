class CreateJoinTableServicePet < ActiveRecord::Migration[7.0]
  def change
    create_join_table :services, :pets do |t|
      t.index [:service_id, :pet_id]
      # t.index [:pet_id, :service_id]
    end
  end
end
