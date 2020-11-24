class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :location, :quota, :start_time, :end_time, :association, :done)
  end
end
