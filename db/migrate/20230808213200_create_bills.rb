class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :service, null: false, foreign_key: true
      t.string :name
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
