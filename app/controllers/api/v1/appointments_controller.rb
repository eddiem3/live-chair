class API::V1::AppointmentsController < ApplicationController
  respond_to :json

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = current_user.appointments.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render :status => 200,
        :json => {:success => true, 
          :info => "Registered",
          :data => {:appointment => @appointment}}

    else
      render :status => :unprocessable_entity,
        :json => {:success => false,
          :info => {},
          :data => {} }
    end
  end

  private

  def appointment_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read))
    return json_params.require.
      (:appointmen).
      permit(:date, :time).
      merge(user: current_user)
  end
end
