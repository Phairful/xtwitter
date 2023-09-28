require 'rails_helper'
RSpec.describe "Tweets", type: :routing do
  

describe "tweets members route" do

    end
    it "Route to /tweets using POST to TweetsController" do
      expect(post:'/tweets').to route_to('tweets#create')
    end
    it "Route to /tweets using PUT/PATCH to TweetsController" do
      expect(put:'/tweets/:id').to route_to('tweets#update')
    end
    it "Route to /tweets using GET to TweetsController" do
      expect(get:'/tweets/:id/edit').to route_to('tweets#edit')
    end
  end



  describe "like a tweet route" do
    it "Route to /tweets/:id/like using POST to TweetsController" do
      expect(post:'/tweets/:id/like').to route_to('tweets#like')
    end
    it "Route to /tweets/:id/like using DELETE to TweetsController" do
      expect(delete:'/tweets/:id/unlike').to route_to('tweets#unlike')
    end
    it "Route to /tweets/:id/retweet using POST to TweetsController" do
      expect(post:'/tweets/:id/retweet').to route_to('tweets#retweet')
    end
    it "Route to /tweets/:id/quote using POST to TweetsController" do
      expect(post:'/tweets/:id/quote').to route_to('tweets#quote')
    end
    it "Route to /tweets/:id/reply using GET to TweetsController" do
      expect(get:'/tweets/:id/reply').to route_to('tweets#reply')
    end
    it "Route to /tweets/:id/bookmark using GOT to TweetsController" do
      expect(post:'/tweets/:id/bookmark').to route_to('tweets#bookmark')
    end
  end
end


require 'rails_helper'

RSpec.describe "Routes", type: :request do

  describe "GET /routes" do
    it "works! (now write some real specs)" do
      get routes_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /tweets/new" do
    it "Route to /tweets/new using GET to TweetsController" do
      expect(get:'/tweets/new').to route_to('tweets#new')
    end
    it "Route to /tweets using POST to TweetsController" do
      expect(post:'/tweets').to route_to('tweets#create')
    end
    #it "Route to /tweets using PUT/PATCH to TweetsController" do
     # expect(put:'/tweets/:id').to route_to('tweets#update')
   # end
    it "Route to /tweets using GET to TweetsController" do
      expect(get:'/tweets/:id/edit').to route_to('tweets#edit')
    end
  end
end