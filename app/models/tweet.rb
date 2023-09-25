class Tweet < ApplicationRecord
    belongs_to :original_tweet, class_name: "Tweet", optional: true, foreign_key: "reply_at_tweet_id"
    belongs_to :tweeting_user, class_name: "User"
    belongs_to :reply_at_tweet, class_name: "Tweet", optional: true

    has_many :likes
    has_many :bookmarks
    has_many :quotes
    has_many :retweets
    has_many :taggings, foreign_key: "tagged_tweet_id"
    
    #validation fo the tweet limit of characters
    validates :tweet_body, 
        length: {within: (1...255)}, 
        presence: { message: "must be given please" }
    
    #validation for the association of the user to tweet
    validates_associated :tweeting_user
end
