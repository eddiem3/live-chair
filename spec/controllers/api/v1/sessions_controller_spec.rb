require 'rails_helper'

RSpec.describe API::V1::SessionsController, :type => :controller do
  describe "Establish a session" do
    
    before do 
      @user = FactoryGirl.create(:user)
    end
    
    subject {}
    
    it "should create a session" do
      
      session_params = { :format => 'json', :session => { :email => @user.email, :password => @user.password_digest }}.to_json


      post :create, session_params
      

      expect(response).to be_success
    end

    # it "should not create a session" do
    #   session_params = { :format => 'json', :session => { :email => @user.email, :password => "wrong_password" }}.to_json
      
    #   post :create, session_params

    #   expect(response).to eq(401)
    # end
    
  end
end
