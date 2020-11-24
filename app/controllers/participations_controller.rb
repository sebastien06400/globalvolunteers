class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new
    @mission = Mission.find(params[:mission_id])
    @user = User.find(params[:user_id])
    @participation.mission = @mission
    @participation.user = @user
    redirect_to mission_path(@mission)
  end
end
