class OrderPolicy < ApplicationPolicy
  def update?
    record.creator_id == user.id
  end
end
