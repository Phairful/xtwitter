require 'rails_helper'
require 'faker'

RSpec.describe "Users API", type: :request do
  let(:user) { create(:user) }

  describe "User Creation" do
    it "creates a new user and returns a 200 status with matching JSON schema" do 
      user_params = { username: "testing_testing", email: "mail@test.com", password: 'Passworasddsd123!@', display_name: "jaimmin" }
      post "/users", params: { user: user_params }
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('user')
    end
  end

  describe "User Tweets" do
    it "retrieves all tweets by a user and returns a 200 status with matching JSON schema" do 
      get "/users/#{user.id}/tweets"
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('user')
    end
  end

  describe "User Tweets & replies" do
    it "retrieves all tweets and replies by a user and returns a 200 status with matching JSON schema" do 
      get "/users/#{user.id}/tweets_replies"
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('user')
    end
  end

  describe "User Profile" do
    it "Shows the profile of a especified user and returns a 200 status with matching JSON schema" do 
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('user')
    end
  end

  describe "User Delete Profile" do
    it "deletes the profile of the session user and returns a 200 status with matching JSON schema" do 
      delete "/users/#{user.id}"
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('user')
    end
  end

end
