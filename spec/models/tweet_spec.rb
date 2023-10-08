require 'rails_helper'
RSpec.describe Tweet, type: :model do
  
# ASSOCIATIONS SPECS

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:likes) }
    it { should have_many(:bookmarks) }
    it { should have_many(:quotes) }
    it { should have_many(:retweets) }
    it { should have_many(:taggings)}
    it { should belong_to(:reply_at_tweet).optional}
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

  it "return user_tweets" do
    user = create(:user)
    tweet1 = create(:tweet, user: user)
    tweet2 = create(:tweet, user: user)
    reply = create(:tweet, user: user, reply_at_tweet_id: tweet2.id)
    tuser= Tweet.user_tweets(user)
    expect(tuser.length).to eq 2
  end

  it "return user_tweets_replies" do
    user = create(:user)
    tweet1 = create(:tweet, user: user)
    tweet2 = create(:tweet, user: user)
    reply = create(:tweet, user: user, reply_at_tweet_id: tweet2.id)
    tuser= Tweet.user_tweets_replies(user)
    expect(tuser.length).to eq 3
  end

  it "return user_retweets" do
    user1 = create(:user)
    tweet1 = create(:tweet)
    user2 = create(:user)
    tweet2 = create(:tweet, user: user2)
    tweet3 = create(:tweet, user: user2)
    rt1 = tweet1.retweeting(user1.id)
    rt2 = tweet2.retweeting(user1.id)
    trt = Tweet.user_retweets(user1)
    expect(trt).to eq 2
  end

  it "return user_likes" do
    user1 = create(:user)
    user2 = create(:user)
    tweet1 = create(:tweet, user: user2)
    tweet2 = create(:tweet, user: user2)
    like1 = tweet1.liking(user1.id)
    like2 = tweet2.liking(user1.id)
    tlikes = Tweet.user_likes(user1)
    expect(tlikes.length).to eq 2 
  end

  it "return user_bookmarks" do
    user1 = create(:user)
    tweet1 = create(:tweet, user: user1)
    tweet2 = create(:tweet, user: user1)
    bookmarking1 = tweet1.bookmarking(user1.id)
    bookmarking2 = tweet2.bookmarking(user1.id)
    tbookmarks = Tweet.user_bookmarks(user1)
    expect(tbookmarks.length).to eq 2
  end
end

#---------------------------------------------------------------------------------------------------------
# METHOD SPECS
  describe "Methods of tweets" do
    
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
      qt = tweet.quoting(user, body)
      actual_quote = Quote.last()
      expect(actual_quote).to eq(qt)
    end

    it "return replying to tweet" do
      user = create(:user)
      tweet = create(:tweet)
      body = Faker::Lorem.unique.sentence
      reply = tweet.replying(user, body)
      actual_reply = Tweet.last()
      expect(actual_reply).to eq(reply)
    end
  
  
  end

#---------------------------------------------------------------------------------------------------------
# METHOD SPECS
  describe "Methods of tweets" do

    it "returns the trial of the hashtags" do
    user = create(:user)
    tweet = user.tweeting("hashtag test #helloWdfsdfrld")
    tag = tweet.create_new_hashtags
    actual_tag = Hashtag.find_by(hashtag_body: "#helloWdfsdfrld")
    expect(actual_tag).to eq(tag)
    end
  end


end