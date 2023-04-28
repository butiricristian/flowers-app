require 'rails_helper'

RSpec.describe Flower, type: :model do
  context "validate name" do
    it "is valid" do
      flower = build(:flower, name: Faker::Beer.brand)
      expect(flower.valid?).to eq(true)
    end

    it "is not valid" do
      flower = build(:flower, name: nil)
      expect(flower.valid?).to eq(false)
    end
  end
end

# == Schema Information
#
# Table name: flowers
#
#  id             :bigint           not null, primary key
#  name           :string
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  species        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
