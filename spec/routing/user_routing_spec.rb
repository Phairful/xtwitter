require 'rails_helper'
RSpec.describe "Tweets", type: :routing do
 #----------------------------------------------------------------------------------------------------------  
    #SPECS FOR USERS THAT ARE A COMMON PATH
    describe "Users only routes" do
        it "Route to /tweets using POST to UsersController" do
          expect(post:'/tweets').to route_to('users#create')
        end
        it "Route to /users/:id using GET to UsersController" do
          expect(get:'/users/:id').to route_to('users#show')
        end
        it "Route to /users/:id using PATCH to UsersController" do
          expect(delete:'/users/:id').to route_to('users#destroy')
        end
    end
#----------------------------------------------------------------------------------------------------------
    #SPECS FOR USERS THAT ARE A PERSONALIZED PATH
    describe "users  members routes" do
        it "Route to /users/:id/tweets using POST to UsersController" do
          expect(post:'/users/:id/tweets').to route_to('users#tweets')
        end
        it "Route to /users/:id/tweets using DELETE to UsersController" do
          expect(delete:'/users/:id/tweets_replies').to route_to('users#tweets_replies')
        end
    end
end