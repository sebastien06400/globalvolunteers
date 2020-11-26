class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:user_id]
      @missions = current_user.missions
    else
    @missions = policy_scope(Mission).order(created_at: :desc)
    end
  end

  def show
    @mission = Mission.find(params[:id])
    authorize @mission
    @markers = [{
      lat: @mission.latitude,
      lng: @mission.longitude
    }]
  end

  def new
    @mission = Mission.new
    authorize @mission
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    authorize @mission
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :location, :quota, :start_time, :end_time, :association, :done, :photo, :latitude, :longitude)
  end
end
