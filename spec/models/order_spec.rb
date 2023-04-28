require 'rails_helper'

RSpec.describe Order, type: :model do
  context "validate address" do
    let(:user) { create(:user) }
    it "is valid" do
      order = build(:order, address: Faker::Address.full_address, creator: user)
      expect(order.valid?).to eq(true)
    end

    it "is not valid" do
      order = build(:order, address: nil)
      expect(order.valid?).to eq(false)
    end
  end
end

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :bigint           not null
#
# Indexes
#
#  index_orders_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
