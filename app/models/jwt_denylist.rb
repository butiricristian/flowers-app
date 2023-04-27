# List of revoked jwt tokens
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end

# == Schema Information
#
# Table name: jwt_denylist
#
#  id         :bigint           not null, primary key
#  exp        :datetime
#  jti        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_jwt_denylist_on_jti  (jti)
#
