require 'rails_helper'
require 'faker'
RSpec.describe User, type: :model do

# ASSOCIATIONS SPECS  

  context "associations" do
    it { should have_many(:follower_user)}
    it { should have_many(:followee_user)}
    it { should have_many(:tweets) }
    it { should have_many(:likes) }
    it { should have_many(:bookmarks) }
    it { should have_many(:quotes) }
    it { should have_many(:retweets) }
  end

#----------------------------------------------------------------------------------------------------------
# CREATION OF USER FOR TESTING
it 'return user' do
  user = create(:user)
end
#---------------------------------------------------------------------------------------------------------
# VALIDATIONS SPECS
  context "validations" do
    
    #Username validation
    it { should validate_presence_of(:username).with_message("must be given a username") }
    it { should validate_length_of(:username).is_at_most(20).with_message("is too long (maximum is 20 characters)") }
    it { should validate_uniqueness_of(:username) }
    
    #Email validation
    it { should validate_presence_of(:email).with_message("must be given an email") }
    it { should validate_uniqueness_of(:email) }
    
    #Password validation
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(12).is_at_most(30).with_message("is too long (maximum is 30 characters)") }
    
    #Display name validation
    it { should validate_length_of(:display_name).is_at_most(20).with_message("is too long (maximum is 20 characters)") }
  end

#---------------------------------------------------------------------------------------------------------
# SCOPES SPECS
  describe "scopes" do
    #let(:user) { create(:user) }
    #let(:another_user) { create(:user) } 
    #let(:tweet) { create(:tweet, user: user) }
    
 
      #create_list(:tweet, 6, user: user)
      #create_list(:retweet, 4, original_retweet: tweet) 
      #create_list(:quote, 3, original_quote: tweet)
      #Crear replies para el usuario
      #tweet_from_another_user = create(:tweet, user: another_user)
      #create(:reply, user: user, tweet: tweet_from_another_user)
    #end

    it "return likes_by_user" do
      user = create(:user)
      likes = User.likes_by_user(user.id)
      expect(likes).to include
    end

    it "return bookmarks_by_user" do
      user = create(:user)
      bookmarks = User.bookmarks_by_user(user.id)
      expect(bookmarks).to include
    end

    it "return retweets_by_user" do
      user = create(:user)
      retweets = User.retweets_by_user(user.id)
      expect(retweets).to include
    end

    it "return tweets_by_user" do
      user = create(:user)
      tweets = User.tweets_by_user(user.id)
      expect(tweets).to include
    end

    it "return followers_count" do
      user = create(:user)
      followers = User.tweets_by_user(user.id)
      expect(followers).to include
    end

    it "return followings_count" do
      user = create(:user)
      following = User.tweets_by_user(user.id)
      expect(following).to include
    end

  end

#---------------------------------------------------------------------------------------------------------
# METHOD SPECS
  describe "Creations" do

    it "creation of Tweet" do
      user = create(:user)
      body = Faker::Lorem.unique.sentence
      t = user.tweeting(body)
      actual_tweet = Tweet.last()
      expect(actual_tweet).to eq(t)
    end

  end
end
