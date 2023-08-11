class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :service, null: false, foreign_key: true
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
