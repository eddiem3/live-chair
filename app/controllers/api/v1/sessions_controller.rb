#module Api
#  module V1
    class API::V1::SessionsController < ApplicationController
      
      def create
        user = authenticate_session(session_params)
        
        if sign_in(user)
          render :status => 200,
          :json => { :success => true,
            :info => "Logged in",
            :data => { :auth_token => current_user.authentication_token } }
          
        else
          render :status => 401,
          :json => { :success => false,
            :info => "Login Failed",
            :data => {} }
        end
      end

      def destroy
        sign_out
        
        render :status => 200,
        :json => { :success => true,
          :info => "Logged out",
          :data => {} }
      end
      

      
      private

      def session_params
        params.require(:session).permit(:email, :password)
      end
    end  
#  end
#end

