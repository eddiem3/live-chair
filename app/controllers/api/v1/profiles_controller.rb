class API::V1::ProfilesController < ApplicationController
  respond_to :json

  def new
    @profile = Profile.new
  end

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
    @reviews = @profile.reviews
    @review = @profile.reviews.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render :status => 200,
        :json => {:success => true, 
          :info => "Registered",
          :data => {:profile => @profile}}

    else
      render :status => :unprocessable_entity,
      :json => {:success => false,
        :info => {},
        :data => {} }
    end
  end

  private

  def profile_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read))
    return json_params.require.
      (:profile).
      permit(:avatar, :shop_name, :address, :state, :city, :zip, :phone).
      merge(user: current_user)
  end
end
