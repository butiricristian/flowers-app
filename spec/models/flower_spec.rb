require 'rails_helper'

RSpec.describe Flower, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
