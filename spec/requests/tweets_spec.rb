require 'rails_helper'

RSpec.describe "Tweets API", type: :request do

  describe "Tweet Creation" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}
      #tweet_params = (:tweet_body "holas")
      it "creates a new tweet and returns a 200 status with matching JSON schema" do 
      post "/tweets" #param {:tweet , :tweet_body: "hello", :user_id: user}
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Update" do
    let(:user) { create(:user)}
    let(:tweet) { create(:tweet, user: user)}
    
    it "updates an existing tweet and returns a 200 status with matching JSON schema" do 
      patch "/tweets/#{tweet.id}", to_param: {tweet: tweet_params }
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweets like", type: :request do
    let(:user) { create(:user)}
    let(:tweet) { create(:tweet, user: user)}

    it "should return a successful 200 response for /tweets/:id/like" do
      post "/tweets/#{tweet.id}/like"
      expect(response).to have_http_status(200)
    end
  end
  
  describe "Tweet Unlike" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "deletes a like for a tweet and returns a 200 status with matching JSON schema" do 
      delete "/tweets/#{tweet.id}/unlike"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Retweet" do

      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "creates a retweet for a tweet and returns a 200 status with matching JSON schema" do
      post "/tweets/#{tweet.id}/retweet"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Quote" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "creates a quote for a tweet and returns a 200 status with matching JSON schema" do 
      post "/tweets/#{tweet.id}/quote"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Reply" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "creates a reply for a tweet and returns a 200 status with matching JSON schema" do
      get "/tweets/#{tweet.id}/reply"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Bookmark" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "creates a bookmark for a tweet and returns a 200 status with matching JSON schema" do 
      post "/tweets/#{tweet.id}/bookmark"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Show" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "retrieves tweet stats and returns a 200 status with matching JSON schema" do 
      get "/tweets/#{tweet.id}"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet delete" do
    let(:user) { create(:user)}
    let(:tweet) { create(:tweet, user: user)}

    it "retrieves tweet stats and returns a 200 status with matching JSON schema" do 
    delete "/tweets/#{tweet.id}"
    expect(response).to have_http_status(200)
    expect(response).to response_schema('tweet')
  end
end
end
