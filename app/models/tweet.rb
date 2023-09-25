class Tweet < ApplicationRecord
#----------------------------------------------------------------------------------------------------------
    belongs_to :original_tweet, class_name: "Tweet", optional: true, foreign_key: "reply_at_tweet_id"
    belongs_to :tweeting_user, class_name: "User"
    belongs_to :reply_at_tweet, class_name: "Tweet", optional: true
    has_many :likes
    has_many :bookmarks
    has_many :quotes
    has_many :retweets
    has_many :taggings, foreign_key: "tagged_tweet_id"

#----------------------------------------------------------------------------------------------------------

    #validation fo the tweet limit of characters
    validates :tweet_body,
        length: {within: (1...255)},
        presence: { message: "must be given please" }

    #validation for the association of the user to tweet
    validates_associated :tweeting_user

#----------------------------------------------------------------------------------------------------------

    #scopes
    scope :retweet_count, -> (id) {
        joins("INNER JOIN retweets ON retweets.retweed_tweet_id = tweets.id")
        .group("retweets.retweed_tweet_id")
        .having("retweets.retweed_tweet_id": id).count}
    scope :bookmarks_count, -> (id)  {
        joins("INNER JOIN bookmarks ON bookmarks.bookmarked_tweet_id = tweets.id")
        .group("bookmarks.bookmarked_tweet_id")
        .having("bookmarks.bookmarked_tweet_id": id).count}
    scope :quotes_count, -> (id) {
        joins("INNER JOIN quotes ON quotes.quoted_tweet_id = tweets.id")
        .group("quotes.quoted_tweet_id")
        .having("quotes.quoted_tweet_id": id).count}
    scope :likes_count, -> (id)  {
        joins("INNER JOIN likes ON likes.liked_tweet_id = tweets.id")
        .group("likes.liked_tweet_id")
        .having("likes.liked_tweet_id": id).count}

#----------------------------------------------------------------------------------------------------------
    #created method to create new tagging record for each hashtag, and a  hashtag id in tagging table if a registry doesn't exist

    def create_new_hashtags
        hashtags = extract_hashtags_from_body
        hashtags.each do |hashtag|
            existing_hashtag = Hashtag.find_by(hashtag_body: hashtag.downcase)

            if existing_hashtag
              tagging = Tagging.find_or_create_by(
                tagged_hashtag_id: existing_hashtag.id,
                tagged_tweet_id: self.id
              )
            else
              new_hashtag = Hashtag.create(hashtag_body: hashtag.downcase)
              tagging = Tagging.create(
                tagged_hashtag_id: new_hashtag.id,
                tagged_tweet_id: self.id
              )
            end

            self.taggings << tagging unless self.taggings.include?(tagging)
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
        Like.new liking_user_id:user_you, liked_tweet_id: self.id
    end
    #Method that allows bookmarking the tweet
    def bookmarking (user_you)
        Bookmark.new bookmarking_user_id:user_you, bookmarked_tweet_id:self.id
    end
    #Method that allows retweeting the tweet
    def retweeting (user_you)
        Retweet.new retweeting_user_id:user_you, retweed_tweet_id: self.id
    end
    #Method that allows quoting the tweet
    def quoting (user_you, quote_text)
        Quote.new quoting_user_id:user_you, quoted_tweet_id: self.id, quote_body:quote_text
    end
end
