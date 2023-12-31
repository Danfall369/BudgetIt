class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
