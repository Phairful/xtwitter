# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version
  3.1.2
- Ruby on Rails version
  7.0.6

- System dependencies

- Configuration

- Database creation

# Relational Database Design for Project Xtwitter_clone

## Project Overview

- **Project Name**: Xtwitter_clone
- **Database Type**: PostgreSQL
- **Note**: This is the database design for a basic twitter clone with the basic data that you could encounter on the web

## Tables

### Table: follows

- **following_user_id**: Integer, not null
- **followed_user_id**: Integer, not null
- **created_at**: Timestamp

This table is used to represent the follow relationships between users. It keeps track of which user follows another user and the timestamp when the follow relationship was created.

### Table: likes

- **like_id**: Integer, primary key
- **liking_user_id**: Integer, not null
- **liked_tweet_id**: Integer, not null

The "likes" table is responsible for storing information about user likes on tweets. Each row represents a user liking a specific tweet by recording the user ID, tweet ID, and a unique like ID.

### Table: user

- **user_id**: Integer, primary key
- **username**: Varchar(20), not null, unique
- **display_name**: Varchar(20), not null
- **email**: Varchar, not null
- **password**: Varchar, not null
- **bio**: Varchar, note: Biography/description of the user
- **location**: Varchar
- **created_at**: Timestamp

The "user" table stores information about registered users on the platform. It includes user-related data such as their username, display name, email, password, bio, location, and the timestamp of user registration.

### Table: tagging

- **tagged_hashtag_id**: Integer
- **tagged_tweet_id**: Integer, not null

The "tagging" table is used to associate tweets with hashtags. It records the hashtag ID and the corresponding tweet ID to enable hashtag-based searching and grouping of tweets.

### Table: hashtag

- **hashtag_id**: Integer, primary key
- **hashtag_body**: Varchar

The "hashtag" table stores unique hashtags used in tweets. It assigns a unique ID to each hashtag and records the actual hashtag text.

### Table: tweet

- **tweet_id**: Integer, primary key
- **tweet_body**: Varchar(280), not null, note: Content of the post
- **tweeting_user_id**: Integer, not null
- **reply_at_tweet_id**: Integer
- **created_at**: Timestamp

The "tweet" table represents individual tweets posted by users. It contains details such as the tweet ID, tweet content, user ID of the tweet's author, the tweet being replied to (if applicable), and the timestamp of tweet creation.

### Table: retweet

- **retweet_id**: Integer, primary key
- **retweed_tweet_id**: Integer, not null
- **retweeting_user_id**: Integer, not null
- **created_at**: Timestamp

The "retweet" table records instances of users retweeting other tweets. It stores information about the retweet ID, the tweet being retweeted, the user performing the retweet, and the timestamp of the retweet action.

### Table: bookmarks

- **bookmarked_tweet_id**: Integer, not null
- **bookmarking_user_id**: Integer, not null
- **created_at**: Timestamp

The "bookmarks" table tracks which tweets are bookmarked by users. It records the tweet ID and user ID to indicate which tweets a user has bookmarked and when they did so.

### Table: quote

- **quote_id**: Integer, primary key
- **quote_body**: Varchar(280), not null, note: Content of the post
- **quoting_user_id**: Integer
- **quoted_tweet_id**: Integer
- **created_at**: Timestamp

The "quote" table represents quoted tweets, where a user quotes another user's tweet. It stores details about the quoted tweet's content, the user performing the quote, the original tweet being quoted, and the timestamp of the quote.

## Logic Behind References (Foreign Keys)

### User-related References

- **"user"."user_id" < "tweet"."tweeting_user_id"**: This reference establishes a connection between the "user" table and the "tweet" table. It ensures that the "tweeting_user_id" in the "tweet" table corresponds to a valid user by referencing the "user_id" in the "user" table. In other words, a tweet can only be associated with a user who exists in the system.
- **"user"."user_id" < "likes"."liking_user_id"**: Similar to the previous reference, this one links the "user" table to the "likes" table. It ensures that the "liking_user_id" in the "likes" table points to a valid user by referencing the "user_id" in the "user" table. It guarantees that likes are attributed to existing users.
- **"user"."user_id" < "bookmarks"."bookmarking_user_id"**: This reference connects the "user" table to the "bookmarks" table. It verifies that the "bookmarking_user_id" in the "bookmarks" table corresponds to an actual user by referencing the "user_id" in the "user" table. It ensures that users can only bookmark tweets if they exist.
- **"user"."user_id" < "quote"."quoting_user_id"**: In a similar fashion, this reference links the "user" table to the "quote" table. It checks that the "quoting_user_id" in the "quote" table is associated with a valid user by referencing the "user_id" in the "user" table. It enforces data integrity when users quote tweets.
- **"user"."user_id" < "retweet"."retweeting_user_id"**: This reference establishes a connection between the "user" table and the "retweet" table. It ensures that the "retweeting_user_id" in the "retweet" table points to an existing user by referencing the "user_id" in the "user" table. It maintains data consistency for retweets.

### Tweet-related References

- **"tweet"."tweet_id" < "bookmarks"."bookmarked_tweet_id"**: This reference connects the "tweet" table to the "bookmarks" table. It guarantees that the "bookmarked_tweet_id" in the "bookmarks" table refers to a valid tweet by referencing the "tweet_id" in the "tweet" table. Users can only bookmark existing tweets.
- **"tweet"."tweet_id" < "quote"."quoted_tweet_id"**: Similar to the previous reference, this one links the "tweet" table to the "quote" table. It verifies that the "quoted_tweet_id" in the "quote" table corresponds to a real tweet by referencing the "tweet_id" in the "tweet" table. It ensures that tweets can only be quoted if they exist.
- **"tweet"."tweet_id" < "likes"."liked_tweet_id"**: This reference establishes a connection between the "tweet" table and the "likes" table. It checks that the "liked_tweet_id" in the "likes" table points to a valid tweet by referencing the "tweet_id" in the "tweet" table. It maintains data integrity for likes on tweets.
- **"tweet"."tweet_id" < "retweet"."retweed_tweet_id"**: In a similar manner, this reference links the "tweet" table to the "retweet" table. It ensures that the "retweed_tweet_id" in the "retweet" table corresponds to an existing tweet by referencing the "tweet_id" in the "tweet" table. It enforces data consistency for retweets.
- **"tweet"."tweet_id" < "tagging"."tagged_tweet_id"**: This reference connects the "tweet" table to the "tagging" table. It guarantees that the "tagged_tweet_id" in the "tagging" table refers to a valid tweet by referencing the "tweet_id" in the "tweet" table. It enables efficient association of tweets with hashtags.

### Follows and Reply References

- **"user"."user_id" < "follows"."following_user_id"**: This reference establishes a link between the "user" table and the "follows" table. It ensures that the "following_user_id" in the "follows" table points to a real user by referencing the "user_id" in the "user" table. It maintains data consistency for follow relationships.
- **"user"."user_id" < "follows"."followed_user_id"**: Similar to the previous reference, this one connects the "user" table to the "follows" table but for the "followed_user_id." It verifies that users can only follow other users who exist in the system.
- **"tweet"."tweet_id" < "tweet"."reply_at_tweet_id"**: This reference links the "tweet" table to itself. It establishes a parent-child relationship between tweets, where a tweet can be a reply to another tweet. The "reply_at_tweet_id" must reference a valid tweet, ensuring proper tweet threading.

### Hashtag and Tagging References

- **"hashtag"."hashtag_id" < "tagging"."tagged_hashtag_id"**: This reference connects the "hashtag" table to the "tagging" table. It ensures that the "tagged_hashtag_id" in the "tagging" table corresponds to an existing hashtag by referencing the "hashtag_id" in the "hashtag" table. It enables efficient hashtag-based searching and grouping of tweets.

These references are tcrucial for maintaining the relationships between various databanks within the Xtwitter_clone project's relational database. They help run the information in an organized manner that allows the search acording to various requirements

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
