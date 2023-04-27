FactoryBot.define do
  factory :order do
    creator_id { nil }
    status { 1 }
    address { Faker::Address.full_address }
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
