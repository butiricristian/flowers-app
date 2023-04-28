class Flower < ApplicationRecord
  has_many :flowers_orders
  has_many :orders, through: :flowers_orders

  monetize :price_cents

  validates :name, presence: true
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
