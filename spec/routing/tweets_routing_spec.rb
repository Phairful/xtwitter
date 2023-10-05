require 'rails_helper'
RSpec.describe "Tweets", type: :routing do
#---------------------------------------------------------------------------------------------------------- 
    #SPECS FOR TWEETS THAT ARE A COMMON PATH

    describe "tweets only routes" do
        it "Route to /tweets using POST to TweetsController" do
          expect(post:'/api/tweets').to route_to('api/tweets#create')
        end
        it "Route to /tweets using GET to TweetsController" do
          #expect(get:'/tweets/:id').to route_to('tweets#show')
          expect(get:'/api/tweets/1').to route_to(controller: "api/tweets", action: "show", id: "1")
        end


        it "Route to /tweets using PATCH to TweetsController" do
          expect(patch:'/api/tweets/1').to route_to(controller: "api/tweets", action: "update", id: "1")
        end
        it "Route to /tweets using DELETE to TweetsController" do
            expect(delete:'/api/tweets/1').to route_to(controller: "api/tweets", action: "destroy", id: "1")
        end
    end
#----------------------------------------------------------------------------------------------------------
    #SPECS FOR TWEETS THAT ARE A PERSONALIZED PATH
    describe "tweets members routes" do
        it "Route to /tweets/:id/like using POST to TweetsController" do
          expect(post:'/api/tweets/1/like').to route_to(controller: "api/tweets", action: "like", id: "1")
        end
        it "Route to /tweets/:id/unlike using DELETE to TweetsController" do
          expect(delete:'/api/tweets/1/unlike').to route_to(controller: "api/tweets", action: "unlike", id: "1")
        end
        it "Route to /tweets/:id/retweet using POST to TweetsController" do
          expect(post:'/api/tweets/1/retweet').to route_to(controller: "api/tweets", action: "retweet", id: "1")
        end
        it "Route to /tweets/:id/quote using POST to TweetsController" do
          expect(post:'/api/tweets/1/quote').to route_to(controller: "api/tweets", action: "quote", id: "1")
        end
        it "Route to /tweets/:id/reply using GET to TweetsController" do
          expect(get:'/api/tweets/1/reply').to route_to(controller: "api/tweets", action: "reply", id: "1")
        end
        it "Route to /tweets/:id/bookmark using POST to TweetsController" do
          expect(post:'/api/tweets/1/bookmark').to route_to(controller: "api/tweets", action: "bookmark", id: "1")
        end
    end
end
