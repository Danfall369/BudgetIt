class CreateBillsServices < ActiveRecord::Migration[7.0]
  def change
    create_table :bills_services do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
    end

    add_index :bills_services, [:bill_id, :service_id], unique: true
  end
end
