FactoryBot.define do
  factory :flower do
    name { Faker::Beer.brand }
    species { Faker::Beer.style }
    price { 1 }
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
