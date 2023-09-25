class RenameTables < ActiveRecord::Migration[7.0]
  def change
    change_table(:bookmarks) do |t|
      t.rename(:bookmarked_tweet_id, :tweet_id) 
      t.rename(:bookmarking_user_id, :user_id)
    end
    change_table(:likes) do |t|
      t.rename(:liked_tweet_id, :tweet_id)
      t.rename(:liking_user_id, :user_id)
    end
    change_table(:quotes) do |t|
      t.rename(:quoting_user_id, :user_id)
      t.rename(:quoted_tweet_id, :tweet_id)
    end
    change_table(:retweets) do |t|
      t.rename(:retweed_tweet_id, :tweet_id)
      t.rename(:retweeting_user_id, :user_id)
    end
    change_table(:taggings) do |t|
      t.rename(:tagged_hashtag_i, :hashtag_id)
      t.rename(:tagged_tweet_id, :tweet_id)
    end
    change_table(:tweets) do |t|
      t.rename(:tweeting_user_id, :user_id)
    end
  end
end
