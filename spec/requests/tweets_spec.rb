require 'rails_helper'

RSpec.describe "Tweets API", type: :request do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet, user: user) }

  describe "Tweet Creation" do
    it "creates a new tweet and returns a 200 status with matching JSON schema" do 
      tweet_params = { body: "This is a body" }
      post "/tweets", params: { tweet: tweet_params }
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Update" do
    it "updates an existing tweet and returns a 200 status with matching JSON schema" do 
      patch "/tweets/#{tweet.id}"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Like" do
    it "creates a like for a tweet and returns a 200 status with matching JSON schema" do 
      post "/tweets/#{tweet.id}/like"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Unlike" do
    it "deletes a like for a tweet and returns a 200 status with matching JSON schema" do 
      delete "/tweets/#{tweet.id}/unlike"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Retweet" do
    it "creates a retweet for a tweet and returns a 200 status with matching JSON schema" do 
      post "/tweets/#{tweet.id}/retweet"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Quote" do
    it "creates a quote for a tweet and returns a 200 status with matching JSON schema" do 
      post "/tweets/#{tweet.id}/quote"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Reply" do
    it "creates a reply for a tweet and returns a 200 status with matching JSON schema" do 
      get "/tweets/#{tweet.id}/reply"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Bookmark" do
    it "creates a bookmark for a tweet and returns a 200 status with matching JSON schema" do 
      post "/tweets/#{tweet.id}/bookmark"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Stats" do
    it "retrieves tweet stats and returns a 200 status with matching JSON schema" do 
      get "/tweets/#{tweet.id}/stats"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end
end

