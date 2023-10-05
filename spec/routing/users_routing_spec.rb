require "rails_helper"

RSpec.describe UsersController, type: :routing do
     #----------------------------------------------------------------------------------------------------------  
        #SPECS FOR USERS THAT ARE A COMMON PATH
        describe "Users only routes" do


          it "Route to /tusers using GET to UsersController" do
            expect(get:'/api/users').to route_to('api/users#index')
          end

            it "Route to /tweets using POST to UsersController" do
              expect(post:'/api/users').to route_to(controller: "api/users", action: "create")

            end
            it "Route to /users/:id using GET to UsersController" do
              expect(get:'/api/users/1').to route_to(controller: "api/users", action: "show", id: "1")
            end
            it "Route to /users/:id using PATCH to UsersController" do
              expect(delete:'/api/users/1').to route_to(controller: "api/users", action: "destroy", id: "1")
            end
        end
    #----------------------------------------------------------------------------------------------------------
        #SPECS FOR USERS THAT ARE A PERSONALIZED PATH
        describe "users  members routes" do
            it "Route to /users/:id/tweets using POST to UsersController" do
              expect(get:'/api/users/1/tweets').to route_to(controller: "api/users", action: "tweets", id: "1")
            end
            it "Route to /users/:id/tweets using DELETE to UsersController" do
              expect(get:'/api/users/1/tweets_replies').to route_to(controller: "api/users", action: "tweets_replies", id: "1")
            end
        end
    end
