class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def show?
    return true
  end
  def new?
    return true
  end
  def create?
    return true
  end 
  def destroy?
    if user
      record.user == user || user.admin
    end
  end

end
