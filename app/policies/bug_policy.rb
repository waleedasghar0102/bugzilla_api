class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.type == 'Qa' or user.type == 'Developer'
    end
  end

  def new?
  	user.type== 'Qa'
  end

  def create?
    user.type == 'Qa'
  end

  def show?
  end

  def update?
  end

  def destroy?
    user.type == 'Qa'
  end
end
