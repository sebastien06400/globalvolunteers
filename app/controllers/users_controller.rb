class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @missions = @user.missions
  end
end
