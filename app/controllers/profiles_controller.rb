class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      flash[:notice] = "Profile created successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.
      require(:profile).permit(:avatar, :shop_name, :phone, :address, :city, :state, :zip).
      merge(user: current_user)
  end
end
