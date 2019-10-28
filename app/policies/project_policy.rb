class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @user.projects
    end
  end
  def new?
  	if user.type=='Manager'
  	 return true
    end
  end

  def create?
    if user.type=='Manager'
      return true
    end
  end

  def show?
    if user.type=='Manager' and record.manager==user
      return true
    end
  end

  def update?
    if user.type==='Manager' and record.manager==user
      return true
    end  
  end

  def destroy?
  	if (user.type=='Manager' && record.manager==user)
      return true
    end
  end
end