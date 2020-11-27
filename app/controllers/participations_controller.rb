class ParticipationsController < ApplicationController
  
  def create
    @participation = Participation.new
    @mission = Mission.find(params[:mission_id])
    authorize @participation
    # @user = User.find(params[:user_id])
    @user = current_user
    @participation.mission = @mission
    @participation.user = @user
    if @participation.save
      redirect_to mission_path(@mission), notice: "Participation enregistrée"
    else
      redirect_to mission_path(@mission), notice: "Participation échouée"
    end
  end

  def destroy
    @participation = Participation.where(user: current_user, mission: params[:mission_id])
    authorize @participation
    @participation[0].destroy
    redirect_to mission_path(params[:mission_id])
  end
end
