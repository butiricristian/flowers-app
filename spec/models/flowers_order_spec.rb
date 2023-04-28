require 'rails_helper'

RSpec.describe FlowersOrder, type: :model do
  context "validate relationships" do
    let(:user) { create(:user) }
    let(:order) { create(:order, creator: user) }
    let(:flower) { create(:flower) }

    it "has order and flower" do
      fo = build(:flowers_order, order:, flower:)
      expect(fo.valid?).to eq(true)
    end

    it "has no order" do
      fo = build(:flowers_order, flower:)
      expect(fo.valid?).to eq(false)
    end

    it "has no flower" do
      fo = build(:flowers_order, order:)
      expect(fo.valid?).to eq(false)
    end
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
#  index_flowers_orders_on_flower_id               (flower_id)
#  index_flowers_orders_on_order_id                (order_id)
#  index_flowers_orders_on_order_id_and_flower_id  (order_id,flower_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (flower_id => flowers.id)
#  fk_rails_...  (order_id => orders.id)
#
