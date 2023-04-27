FactoryBot.define do
  factory :flowers_order do
    order { nil }
    flower { nil }
    quantity { 1 }
  end
end

# == Schema Information
#
# Table name: flowers_orders
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flower_id  :bigint           not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_flowers_orders_on_flower_id  (flower_id)
#  index_flowers_orders_on_order_id   (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (flower_id => flowers.id)
#  fk_rails_...  (order_id => orders.id)
#
