module Helpers
  module Auth
    def get_bearer(user)
      Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization']
    end
  end
end
