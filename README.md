#ReadMe

##Getting Started
1. Create a postgresql user called 'live-chair' with the password 'live-chair'
  1. sudo -u postgres createuser --superuser live-chair
  2. sudo -u postgres psql
  3. postgres=# \password live-chair
  4. Enter 'live-chair' as the password and password confirmation 
  5. \q 

2. rake db:create


##Adding an api function example
Let's say we already have a resource for barbers and we want a function to list all barbers

1. Add the resource under the api version 1 namespace

 namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :barbers
    end

2. Make a new controller at app/controllers/api/v1/barbers_controller.rb. 
  a. Notice because of the namespacing our controller class is nested in two modules.
  b. We are using respond_to :json at the class level because rails will throw an error otherwise :/

3. Encapsulate the controller in the Api and V1 module
   
   module Api
      module V1
         
         
         class BarbersController < ApplicationController
	   respond_to :json	
         end
      end
   end

4. Add necessary index function

      def index
        @barbers = Barber.all
      end
    
    There's no need to add anything else because rabl is handling the view and our routes.rb and our class know to render json. We don't even     have to say render

5. Make a rabl file at app/views/api/v1/barbers/index.json.rabl to determine which parameters to provide in json format.
   collection @projects
   attributes :id, :name

6. Point your browser to localhost:3000/api/v1/barbers and you should have some awesome JSON!

##Starter Code
You can copy this test I did to get you started.

###app/controllers/api/v1/projects_controller.rb

`module Api
  module V1
    class ProjectsController < ApplicationController
      
      respond_to :json
      
      def index
        @projects = Project.all

      end

      def show
        respond_with Project.find(params[:id])
      end
      
      def create
        respond_with Project.create(params[:product])
      end
      
      def update
        respond_with Project.update(params[:id], params[:products])
      end
      
      def destroy
        respond_with Project.destroy(params[:id])
      end
    end

  end
end`


###Index.json.rabl:
`collection @projects
attributes :id, :name, :description`










