class AddIndexToFlowersOrderByFlowerIdAndOrderId < ActiveRecord::Migration[7.0]
  def change
    add_index :flowers_orders, [:order_id, :flower_id], unique: true
  end
end
