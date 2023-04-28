require 'rails_helper'

RSpec.describe User, type: :model do
  context "validate email" do
    it "is valid" do
      user = build(:user)
      expect(user.valid?).to eq(true)
    end

    it "is not valid" do
      user = build(:user, email: nil)
      expect(user.valid?).to eq(false)
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  phone_number           :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
