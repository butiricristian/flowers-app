class Order < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :flowers_orders
  has_many :flowers, through: :flowers_orders

  accepts_nested_attributes_for :flowers_orders

  enum status: %i[pending delivered canceled]

  validates :address, presence: true
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
