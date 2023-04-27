class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :creator, null: false, foreign_key: { to_table: :users }
      t.integer :status
      t.string :address

      t.timestamps
    end
  end
end
