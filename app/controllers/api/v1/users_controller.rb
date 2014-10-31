class API::V1::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
  :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_action :require_login, only: [:new, :create]
  
  def index
    @users = User.all
  end

  def barbers
    @barbers = User.find(:all, :conditions => {:barber=>true})
  end

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      
      render :status => 200,
      :json => { :success => true,
        :info => "Registered",
        :data => { :user => @user}}
        
    else
      render :status => :unprocessable_entity,
      :json => { :success => false,
        :info => {},
        :data => {} }
    end
  end

  private

  def user_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read))
    return json_params.require(:user).permit(:fname,:lname,:email, :password, :barber)
  end
end  


