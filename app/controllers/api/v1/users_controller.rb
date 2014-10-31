class API::V1::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
  :if => Proc.new { |c| c.request.format == 'application/json' }
  
  
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
      redirect_to root_path
    else
      render :new
    end
  end

  
  private

  def user_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read))
    return json_params.require(:user).permit(:fname,:lname,:email, :password, :barber)
  end
end  


