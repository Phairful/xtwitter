require 'rails_helper'


RSpec.describe Tweet, type: :model do
  
# ASSOCIATIONS SPECS

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:likes) }
    it { should have_many(:bookmarks) }
    it { should have_many(:quotes) }
    it { should have_many(:retweets) }
  end

#----------------------------------------------------------------------------------------------------------
# VALIDATIONS SPECS
  context "validations" do
    it { should validate_presence_of(:tweet_body).with_message("must be given please") }
    it { should validate_length_of(:tweet_body).is_at_least(1).is_at_most(255) }
  end

#----------------------------------------------------------------------------------------------------------
# SCOPE SPECS
describe "Scopes of Counts" do
  #
  it "return retweets_count" do
    tweet = create(:tweet)
    t = Tweet.retweet_count(tweet.id)
    expect(t).to include
  end

  it "return bookmarks_count" do
    tweet = create(:tweet)
    t = Tweet.bookmarks_count(tweet.id)
    expect(t).to include
  end

  it "return quotes_count" do
    tweet = create(:tweet)
    t = Tweet.quotes_count(tweet.id)
    expect(t).to include
  end

  it "return likes_count" do
    tweet = create(:tweet)
    rt = Tweet.likes_count(tweet.id)
    expect(rt).to include
  end
end

#---------------------------------------------------------------------------------------------------------
# METHOD SPECS
  describe "scopes of tweets" do
    
    #test the liking a tweet function
    it "return liking tweet" do
      user = create(:user)
      tweet = create(:tweet)
      l = tweet.liking(user.id)
      actual_like = Like.last()
      expect(actual_like).to eq(l)
    end
    
    #test the bookmarking a tweet function
    it "return bookmarking tweet" do
      user = create(:user)
      tweet = create(:tweet)
      bookmark = tweet.bookmarking(user.id)
      actual_bookmark = Bookmark.last()
      expect(actual_bookmark).to eq(bookmark)
    end

    #test the retweeting a tweet function
    it "return retweeting tweet" do
      user = create(:user)
      tweet = create(:tweet)
      rt = tweet.retweeting(user.id)
      actual_rt = Retweet.last()
      expect(actual_rt).to eq(rt)
    end

    #test the retweeting a tweet function
    it "return quoting tweet" do
      user = create(:user)
      tweet = create(:tweet)
      body = Faker::Lorem.unique.sentence
      qt = tweet.quoting(user.id, body)
      actual_quote = Quote.last()
      expect(actual_quote).to eq(qt)
    end

    it "return replying to tweet" do
      user = create(:user)
      tweet = create(:tweet)
      body = Faker::Lorem.unique.sentence
      reply = tweet.replying(user.id, body)
      actual_reply = Tweet.last()
      expect(actual_reply).to eq(reply)
    end
  
  
  end

#---------------------------------------------------------------------------------------------------------
# METHOD SPECS
  describe "scopes of tweets" do

    it "returns the trial of the hashtags" do
    user = create(:user)
    tweet = user.tweeting("hashtag test #helloWorld")
    tag = tweet.create_new_hashtags
    actual_reply = Tagging.last()
    expect(actual_tag).to eq(tag)
    end
  end


end