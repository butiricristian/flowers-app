class CreateFlowersOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers_orders do |t|
      t.references :order, null: false, foreign_key: true
      t.references :flower, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
