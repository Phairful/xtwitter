# == Schema Information
#
#create_table "tweets"
#    t.string "tweet_body", limit: 280
#    t.integer "user_id"
#   t.integer "reply_at_tweet_id"
#  t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
#
#----------------------------------------------------------------------------------------------------------
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
        length: {within: (1..255)},
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
    
    #find tweets for all the parameters required
    
    scope :user_tweets, -> (user_id) {
        joins(:users)
        .where(users: { user_id: user_id})} 
        #and tweets: {reply_at_tweet_id: null})}

    scope :user_retweets, ->(user_id) {
        joins(:retweets)
        .where(retweets: { user_id: user_id })
        }
    scope :user_likes, ->(user_id) {
        joins(:likes)
        .where(likes: { user_id: user_id })
        }
    scope :user_bookmarks, ->(user_id) {
        joins(:bookmarks)
        .where(bookmarks: { user_id: user_id })
        }

#----------------------------------------------------------------------------------------------------------
    #created method to create new tagging record for each hashtag, and a  hashtag id in tagging table if a registry doesn't exist
    
    def create_new_hashtags
        hashtags = extract_hashtags_from_body
        hashtags.each do |hashtag|
            #checks if the hashtag exists
            existing_hashtag = Hashtag.find_by(hashtag_body: hashtag.downcase)
            #if hashtag exists then it creates a new registry in the taggings table
            if existing_hashtag
            new_tagging = Tagging.find_or_create_by(
                hashtag_id: existing_hashtag.id,
                tweet_id: self.id
                )
            #else it creates a new registry in the hashtag table and then the corresponding registry in the taggin table
            else
            new_hashtag = Hashtag.create(hashtag_body: hashtag.downcase)
            tagging = Tagging.create(
                hashtag_id: new_hashtag.id,
                tweet_id: self.id
                )
            end
        end
    end

    #this is the method that allows the extracting of the hashtags so the create new hashtag method can check if the hashtag neww creating or not
    def extract_hashtags_from_body
    	self.tweet_body.scan(/#\w+/).map { |tag| tag.downcase}
    end

#----------------------------------------------------------------------------------------------------------

    #Method that allows liking the tweet
    def liking (user_you)
        Like.create user_id:user_you, tweet_id: self.id
    end
    
    #Method that allows bookmarking the tweet
    def bookmarking (user_you)
        Bookmark.create user_id:user_you, tweet_id:self.id
    end
    
    #Method that allows retweeting the tweet
    def retweeting (user_you)
        Retweet.create user_id:user_you, tweet_id: self.id
    end
    
    #Method that allows quoting the tweet
    def quoting (user_you, quote_text)
        Quote.create user_id: user_you , tweet_id: self.id, quote_body:quote_text
    end

    def replying (user_you, body)
        Tweet.create user_id:user_you, tweet_body:body, reply_at_tweet: self.id
    end 

end