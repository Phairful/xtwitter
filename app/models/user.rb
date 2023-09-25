class User < ApplicationRecord
    has_many :followee_user, foreign_key: :follower_user_id, class_name: 'Follow'
    has_many :follower_user, foreign_key: :followee_user_id, class_name: 'Follow'
    has_and_belongs_to_many :Tweet, join_table: "table_name", foreign_key: "Tweet_id"
    has_many :tweets, foreign_key: "tweeting_user_id"
    has_many :likes, foreign_key: "liking_user_id"
    has_many :bookmarks, foreign_key: "bookmarking_user_id"
    has_many :quotes, foreign_key: "quoting_user_id"
    has_many :retweets, foreign_key: "retweeting_user_id"

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
        joins("INNER JOIN follows ON follows.follower_user_id = user.id")
        .group("follows.follower_user_id")
        .having("follows.follower_user_id": id).count}
    scope :followings_count, ->(id) {
        joins("INNER JOIN follows ON follows.followee_user_id = user.id")
        .group("follows.followee_tweet_id")
        .having("follows.followee_tweet_id": id).count}
    scope :likes_by_user, ->(id) {
        joins("INNER JOIN likes ON likes.liking_user_id = user.id")
        .group("likes.liking_user_id")
        .having("likes.liking_user_id": id)}
    scope :bookmarks_by_user, ->(id) {
        joins("INNER JOIN bookmarks ON bookmarks.bookmarking_user_id = user.id")
        .group("bookmarks.bookmarking_user_id")
        .having("bookmarks.bookmarking_user_id": id)}
    scope :retweets_by_user, ->(id) {
        joins("INNER JOIN retweets ON retweets.retweeting_user_id = user.id")
        .group("retweets.retweeting_user_id")
        .having("retweets.retweeting_user_id": id)}
    scope :tweets_by_user, ->(id) {
        joins("INNER JOIN tweets ON tweets.tweeting_user_id = users.id")
        .where("tweets.reply_at_tweet IS NULL")
        .group("tweets.tweeting_user_id")
        .having("tweets.tweeting_user_id = ?", id)}
    scope :tweets_replies_by_user, ->(id) {
        joins("INNER JOIN tweets ON tweets.tweeting_user_id = user.id")
        .group("tweets.tweeting_user_id")
        .having("tweets.tweeting_user_id": id)}

end
