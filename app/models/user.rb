class User < ApplicationRecord
    has_many :followee_user, foreign_key: :follower_user_id, class_name: 'Follow'
    has_many :follower_user, foreign_key: :followee_user_id, class_name: 'Follow'  
    has_and_belongs_to_many :Tweet, join_table: "table_name", foreign_key: "Tweet_id"
    
    has_many :tweets, foreign_key: "tweeting_user_id"
    has_many :likes, foreign_key: "liking_user_id"
    has_many :bookmarks, foreign_key: "bookmarking_user_id"
    has_many :quotes, foreign_key: "quoting_user_id"
    has_many :retweets, foreign_key: "retweeting_user_id"

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
end
