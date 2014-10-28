require 'rails_helper'

RSpec.describe API::V1::SessionsController, :type => :controller do
  describe "Establish a session" do
    
    before do 
      @user = FactoryGirl.create(:user)
    end
    
    subject {}
    
    it "should create a session" do
      
      json = { :format => 'json', :session => { :email => @user.email, :password => @user.password_digest }}.to_json


      post :create, json
      

      expect(response).to be_success
    end
  end
end
