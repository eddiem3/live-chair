require 'rails_helper'

RSpec.describe API::V1::UsersController, :type => :controller do
  
  render_views
  
  describe "User API" do


    describe "General functions" do
    
      before do
        @user = FactoryGirl.create(:user)
        @user1 = FactoryGirl.create(:userOne)
        @user2 = FactoryGirl.create(:barber1)
        @user3 = FactoryGirl.create(:barber2)
        
      end
      
      
      context "Get Barbers" do
        it "should list all barbers in the db" do
          get :barbers, :format => :json
          
          
          json = JSON.parse(response.body)        
          expect(json.length).to eq(2)
          
          puts "RESONSE #{response.body}"
        end
        
        it "should list provide barber id" do
          get :barbers
          
          json = JSON.parse(response.body)        
          expect(json.length).to eq(2)   
          
          puts "RESONSE #{response.body}"
        end
      end
    end
  
     
    describe "Creating a user" do
      context "Valid credentials" do
        it "it should create a new user" do
          user_params = { :format => 'json', :user => {:fname=> "Fname", :lname => "Lname", :email => "root@domain.com", :password => "pass123", :barber=> true }}
          
          post :create, user_params.to_json
          json = JSON.parse(response.body)
          expect(json['success']).to eq(true)
          expect(json['info']).to eq('Registered')
          expect(json['data']['user']['fname']).to eq(user_params[:user][:fname]) 
          expect(json['data']['user']['lname']).to eq(user_params[:user][:lname]) 
          expect(json['data']['user']['email']).to eq(user_params[:user][:email])             
        end
      end
    end
      
      
    describe "Rejecting user creation with missing parameter" do
     
      context "missing email" do

        it "should not have a status of unprocessable entity" do
          user_params = { :format => 'json', :user => {:fname=> "Fname", :lname => "Lname", :password => "pass123", :barber=> true }}
          
          post :create, user_params.to_json
          json = JSON.parse(response.body)

          assert_response 422
          
        end

        it "it should not create a new user" do
          user_params = { :format => 'json', :user => {:fname=> "Fname", :lname => "Lname", :password => "pass123", :barber=> true }}
          
          post :create, user_params.to_json
          json = JSON.parse(response.body)
          expect(json['success']).to eq(false)
        end
      end
    end
  end
end



    

