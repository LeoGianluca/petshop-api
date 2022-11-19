class CreateJoinTablePersonService < ActiveRecord::Migration[7.0]
  def change
    create_join_table :people, :services do |t|
      t.index [:person_id, :service_id]
      # t.index [:service_id, :person_id]
    end
  end
end
