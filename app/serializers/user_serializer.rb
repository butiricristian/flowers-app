class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :username, :phone_number
end
