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
```
 namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :barbers
    end
```

2. Make a new controller at app/controllers/api/v1/barbers_controller.rb. 
  a. Notice because of the namespacing our controller class is nested in two modules.
  b. We are using respond_to :json at the class level because rails will throw an error otherwise :/

3. Encapsulate the controller in the Api and V1 module
   ```
   module Api
      module V1         
         class BarbersController < ApplicationController
	     respond_to :json	
         end
      end
   end
   ```
4. Add necessary index function
   ```
      def index
        @barbers = Barber.all
      end`
   ```	
    
    There's no need to add anything else because rabl is handling the view and our routes.rb and our class know to render json. We don't even     have to say render

5. Make a rabl file at app/views/api/v1/barbers/index.json.rabl to determine which parameters to provide in json format.
   ```
   collection @projects
   attributes :id, :name`
   ```

6. Point your browser to localhost:3000/api/v1/barbers and you should have some awesome JSON!

##Starter Code
You can copy this test I did to get you started.

###app/controllers/api/v1/projects_controller.rb
```
 module Api
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
end
```


###Index.json.rabl:
```
collection @barbers
attributes :id, :name, :skills
```

##Project Work Flow
It is essential we stick with this work flow, especially the 'how to merge' section below will help us contain merge conflicts

1. Assign trello card to self
2. Create branch based on trello card functionality (e.g. git checkout -b mm-sign-up)
3. Work on branch, create small commits
4. Push up to origin: git push origin mm-sign-up
5. Review commits, add link to trello card, and create PR (Pull Request)
6. Incorporate feedback, repeat #5 until no more feedback

###HOW TO MERGE
```
1. git checkout master
2. git pull --rebase origin master
3. git checkout mm-sign-up
4. git rebase -i master
5. git checkout master
6. git merge mm-sign-up
7. git push origin master
```

###DELETION OF BRANCHES
```
1. git push origin :mm-sign-up
2. git branch -d mm-sign-up
```

##README TODO
1. Specify conventions for api calls
2. Choose a templating engine like Slim or Haml.
