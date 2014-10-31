require 'rails_helper'


RSpec.describe API::V1::SessionsController, :type => :controller do
  
  describe "Session API" do
    
    before do
      @user = FactoryGirl.create(:user)
    end
    
      context "User name and password are correct" do
        it "should return a successful response with valid credentials" do
          session_params = { :format => 'json', :session => { :email => @user.email, :password => @user.password_digest }}.to_json
          post :create, session_params
          expect(response).to be_success
        end
      end
      
      context "User name and password are correct" do
        it "should log in" do
          session_params = { :format => 'json', :session => { :email => @user.email, :password => @user.password_digest }}.to_json
          post :create, session_params
          json = JSON.parse(response.body)
          expect(json['success']).to eq(true)
          expect(json['info']).to eq('Logged in')
        end
      end
    
    
      context "Email is incorrect" do
        it "should not log in" do
          session_params = { :format => 'json', :session => { :email => 'wrong@address.com', :password => @user.password_digest }}.to_json
          post :create, session_params
          
          json = JSON.parse(response.body)
          
          (expect(response.status).to eq(401))
          expect(json['success']).to eq(false)
          expect(json['info']).to eq("Login Failed")
        end
      end
      
      context "when a user is logging out" do
        
        it "should destroy the session and logout" do
          post :destroy
          json = JSON.parse(response.body)
          expect(response.status).to eq(200)
          
          expect(json['success']).to eq(true)
          expect(json['info']).to eq('Logged out')
        end      


      #  context "Password is incorrect" do
      #   it "should not login" do
      #       session_params = { :format => 'json', :session => { :email => @user.email, :password => 'wrong123' }}.to_json
      #       post :create, session_params
      
      #       json = JSON.parse(response.body)
      
      #       expect(response).to eq(401)
      #       expect(json['success']).to eq(false)
      #       expect(json['info']).to eq("Login Failed")
      #     end 
      #   end      
   
    end
  end
end
