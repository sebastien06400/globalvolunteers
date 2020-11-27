class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    if user.participations.include?(Participation.where(user: record.first.user_id, mission: record.first.mission_id).first)
      record.first.user == user
    end
  end
end
