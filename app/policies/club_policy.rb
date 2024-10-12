
class ClubPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user.present? && record.user_id == user
  end

  def destroy?
    user.present? && record.user_id == user
  end
end
