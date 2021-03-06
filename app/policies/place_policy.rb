class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def edit?
    is_owner?
  end

  def show?
    true
  end

  def destroy?
    is_owner?
  end

  def update?
    is_owner?
  end

  private

  def is_owner?
    # user   ==> current_user
    # record ==> @place
    record.user_id == user.id
  end
end
