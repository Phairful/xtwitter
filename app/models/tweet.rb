class Tweet < ApplicationRecord
#----------------------------------------------------------------------------------------------------------
    belongs_to :original_tweet, class_name: "Tweet", optional: true, foreign_key: "reply_at_tweet_id"
    belongs_to :user, class_name: "User"
    belongs_to :reply_at_tweet, class_name: "Tweet", optional: true
    has_many :likes
    has_many :bookmarks
    has_many :quotes
    has_many :retweets
    has_many :taggings, foreign_key: "tweet_id"

#----------------------------------------------------------------------------------------------------------

    #validation fo the tweet limit of characters
    validates :tweet_body,
        length: {within: (1...255)},
        presence: { message: "must be given please" }

    #validation for the association of the user to tweet
    validates_associated :user

#----------------------------------------------------------------------------------------------------------

    #scopes
    scope :retweet_count, -> (id) {
        joins("INNER JOIN retweets ON retweets.tweet_id = tweets.id")
        .group("retweets.tweet_id")
        .having("retweets.tweet_id": id).count} 
       
    scope :bookmarks_count, -> (id)  {
        joins("INNER JOIN bookmarks ON bookmarks.tweet_id = tweets.id")
        .group("bookmarks.tweet_id")
        .having("bookmarks.tweet_id": id).count}
    scope :quotes_count, -> (id) {
        joins("INNER JOIN quotes ON quotes.tweet_id = tweets.id")
        .group("quotes.tweet_id")
        .having("quotes.tweet_id": id).count}
    scope :likes_count, -> (id)  {
        joins("INNER JOIN likes ON likes.tweet_id = tweets.id")
        .group("likes.tweet_id")
        .having("likes.tweet_id": id).count}

#----------------------------------------------------------------------------------------------------------
    #created method to create new tagging record for each hashtag, and a  hashtag id in tagging table if a registry doesn't exist




    #this is the method that allows the extracting of the hashtags so the create new hashtag method can check if the hashtag neww creating or not
    def extract_hashtags_from_body
    	self.tweet_body.scan(/#\w+/).map { |tag| tag.downcase}
    end

#----------------------------------------------------------------------------------------------------------

    #Method that allows liking the tweet
    def liking (user_you)
        Like.new user_id:user_you, tweet_id: self.id
    end
    
    #Method that allows bookmarking the tweet
    def bookmarking (user_you)
        Bookmark.new user_id:user_you, tweet_id:self.id
    end
    
    #Method that allows retweeting the tweet
    def retweeting (user_you)
        Retweet.new user_id:user_you, tweet_id: self.id
    end
    
    #Method that allows quoting the tweet
    def quoting (user_you, quote_text)
        Quote.new user_id:user_you, tweet_id: self.id, quote_body:quote_text
    end

end
