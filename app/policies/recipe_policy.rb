class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def user_only
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def show?
    true
  end

  def new?
    !!user
  end

  def edit?
    !!user && (user.admin? || user.id == record.user_id)
  end

  def create?
    !!user
  end

  def update?
    user.admin? || record.try(:user) == user
  end
end