require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
