# == Schema Information
#
#create_table "users", force: :cascade do |t|
#    t.string "username", limit: 20
#    t.string "display_name", limit: 20
#    t.string "email"
#    t.string "password"
#    t.string "bio"
#   t.string "location"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false#
#
#----------------------------------------------------------------------------------------------------------
class User < ApplicationRecord
    #my leader is the person being follow, and the follower is the making the follow
    #my followers are the persons that i lead,
    #if i want to see my follower i should look up for the followees of mine are
    has_many :followee_user, foreign_key: :follower_user_id, class_name: 'Follow'
    has_many :follower_user, foreign_key: :followee_user_id, class_name: 'Follow'
    has_and_belongs_to_many :Tweet, join_table: "table_name", foreign_key: "Tweet_id"
    has_many :tweets, foreign_key: "user_id"
    has_many :likes, foreign_key: "user_id"
    has_many :bookmarks, foreign_key: "user_id"
    has_many :quotes, foreign_key: "user_id"
    has_many :retweets, foreign_key: "user_id"

#----------------------------------------------------------------------------------------------------------

    #created the validation for user always having a username not more long that 20 characters, having an email and having a password that meets security validation of At least 1 uppercase letter, at least 1 lowercase letter, at least 1 number and at least 1 special character like !@/*-+_"
    validates :username,
        uniqueness: true,
        length: {within: (1...20)},
        presence: { message: "must be given a username" }
    validates :email,
        uniqueness: true,
        presence: { message: "must be given an email" }
    validates :password,
        length: {within: (12...30)},
        presence: true,
        format: { with: /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])/ , message:
        "Password must contain, At least 1 uppercase letter, at least 1 lowercase letter, at least 1 number and at least 1 special character like !@/*-+_"}
    validates :display_name,
        length: {within: (1...20)}

 #----------------------------------------------------------------------------------------------------------

    # created scopes for finding tweets, tweet & Replies and bookmarks with a user parameter
    scope :followers_count, ->(id) {
        joins("INNER JOIN follows ON follows.follower_user_id = users.id")
        .group("follows.follower_user_id")
        .having("follows.follower_user_id": id).count}
    scope :followings_count, ->(id) {
        joins("INNER JOIN follows ON follows.followee_user_id = users.id")
        .group("follows.followee_tweet_id")
        .having("follows.followee_tweet_id": id).count}   
    
    scope :likes_by_user, ->(id) {Tweet.user_likes(id)}
    scope :bookmarks_by_user, ->(id) {Tweet.user_bookmarks(id)}
    scope :retweets_by_user, ->(id) {Tweet.user_retweets(id)}
    
    scope :tweets_by_user, ->(id) {Tweet.user_tweets(id)}
        #joins("INNER JOIN tweets ON tweets.user_id = users.id")
        #.where("tweets.reply_at_tweet_id IS NULL")
        #.group("tweets.user_id")
        #.having("tweets.user_id = ?", id)

    scope :tweets_replies_by_user, ->(id) {
        joins("INNER JOIN tweets ON tweets.user_id = users.id")
        .group("tweets.user_id")
        .having("tweets.user_id": id)}

#----------------------------------------------------------------------------------------------------------

    #Method that allows creating a new tweet
    def tweeting (tweet_body)
        Tweet.new user_id:self.id, tweet_body:tweet_body
    end 

end
