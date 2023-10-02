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

    it "return likes_by_user" do
      user = create(:user)
      likes = User.likes_by_user(user)
      expect(likes).to include
    end

    it "return bookmarks_by_user" do
      user = create(:user)
      bookmarks = User.bookmarks_by_user(user)
      expect(bookmarks).to include
    end

    it "return retweets_by_user" do
      user = create(:user)
      retweets = User.retweets_by_user(user)
      expect(retweets).to include
    end

    it "return tweets_by_user" do
      user = create(:user)
      tweet1 = create(:tweet, user: user)
      tweet2 = create(:tweet, user: user)
      reply = create(:tweet, user: user, reply_at_tweet_id: tweet2.id)
      tuser= User.tweets_by_user(user)
      expect(tuser.length).to eq 2
      #expect(tweets).to_eq (test)
    end

    it "return user_tweets_replies" do
      user = create(:user)
      tweet1 = create(:tweet, user: user)
      tweet2 = create(:tweet, user: user)
      reply = create(:tweet, user: user, reply_at_tweet_id: tweet2.id)
      tuser= User.tweets_replies_by_user(user)
      expect(tuser.length).to eq 3
    end

    it "return followers_count" do
      user = create(:user)
      followers = User.followers_count(user.id)
      expect(followers).to include
    end

    it "return followings_count" do
      user = create(:user)
      following = User.followings_count(user.id)
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
