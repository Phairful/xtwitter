require 'rails_helper'

RSpec.describe "Tweets API", type: :request do

  #DONE
  describe "Tweet Creation" do
    let(:user) { create(:user) }
    let(:tweet_params) { { tweet: { tweet_body: "asdasdasd" ,user_id: user.id } } }
    let(:token) { JsonWebToken.encode(sub: user.id)}
    
    it "creates a new tweet and returns a 200 status with matching JSON schema" do 
      post api_tweets_path, params: tweet_params, headers: {"Authorization": "Bearer #{token}"}
        puts response.body

        expect(response).to have_http_status(:created)


      expect(response).to have_http_status(201)
      expect(response).to match_response_schema('tweet')
    end
  end

  #DONE
  describe "Tweet Update" do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet, user: user) }
    it "updates an existing tweet and returns a 200 status with matching JSON schema" do
      update_tweet_params= {tweet_body: "New body"}
      patch "/api/tweets/#{tweet.id}", params: { tweet: update_tweet_params}, as: :json


      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('tweet')
    end
  end


  describe "Tweets like" do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet, user: user) }

    it "should return a successful 200 response for api/tweets/:id/like with matching JSON schema" do
      post "/api/tweets/#{tweet.id}/like"
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('show')
    end
  end
  

  describe "Tweet Unlike" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "deletes a like for a tweet and returns a 200 status with matching JSON schema" do 
      delete "/api/tweets/#{tweet.id}/unlike"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('show')
    end
  end


  describe "Tweet Retweet" do

      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "creates a retweet for a tweet and returns a 200 status with matching JSON schema" do
      post "/api/tweets/#{tweet.id}/retweet"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('show')
    end
  end


  describe "Tweet Quote" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}
      it "creates a quote for a tweet and returns a 200 status with matching JSON schema" do 
      post "/api/tweets/#{tweet.id}/quote"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end


  describe "Tweet Reply" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "creates a reply for a tweet and returns a 200 status with matching JSON schema" do
      get "/api/tweets/#{tweet.id}/reply"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet Bookmark" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "creates a bookmark for a tweet and returns a 200 status with matching JSON schema" do 
      post "/api/tweets/#{tweet.id}/bookmark"
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet show info data" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "retrieves tweet stats and returns a 200 status with matching JSON schema" do 
      get "/api/tweets/#{tweet.id}/stats", params:{}, headers: {"Authorization": "Bearer #{token}"}
      expect(response).to have_http_status(200)
      expect(response).to response_schema('tweet')
    end
  end

  describe "Tweet delete" do
    let(:user) { create(:user)}
    let(:tweet) { create(:tweet, user: user)}

    it "retrieves tweet stats and returns a 200 status with matching JSON schema" do 
    delete "/api/tweets/#{tweet.id}"
    expect(response).to have_http_status(200)
    expect(response).to response_schema('tweet')
  end
end
end
