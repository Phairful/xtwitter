require "rails_helper"

RSpec.describe UsersController, type: :routing do
     #----------------------------------------------------------------------------------------------------------  
        #SPECS FOR USERS THAT ARE A COMMON PATH
        describe "Users only routes" do


          it "Route to /tweets using GET to UsersController" do
            expect(get:'/users').to route_to('users#index')
          end

            it "Route to /tweets using POST to UsersController" do
              expect(post:'/users').to route_to(controller: "users", action: "create")

            end
            it "Route to /users/:id using GET to UsersController" do
              expect(get:'/users/1').to route_to(controller: "users", action: "show", id: "1")
            end
            it "Route to /users/:id using PATCH to UsersController" do
              expect(delete:'/users/1').to route_to(controller: "users", action: "destroy", id: "1")
            end
        end
    #----------------------------------------------------------------------------------------------------------
        #SPECS FOR USERS THAT ARE A PERSONALIZED PATH
        describe "users  members routes" do
            it "Route to /users/:id/tweets using POST to UsersController" do
              expect(get:'/users/1/tweets').to route_to(controller: "users", action: "tweets", id: "1")
            end
            it "Route to /users/:id/tweets using DELETE to UsersController" do
              expect(get:'/users/1/tweets_replies').to route_to(controller: "users", action: "tweets_replies", id: "1")
            end
        end
    end
