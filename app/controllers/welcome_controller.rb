class WelcomeController < ApplicationController
  def show
    @user = User.new
  end
end
