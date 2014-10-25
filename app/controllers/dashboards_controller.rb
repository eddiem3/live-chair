class DashboardsController < ApplicationController
  def show
    @user = User.find_by(email: params[:id])
    @profile = Profile.new
  end
end
