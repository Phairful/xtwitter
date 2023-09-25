class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :tweet_body, limit: 280
      t.integer :tweeting_user_id
      t.integer :reply_at_tweet_id

      t.timestamps
    end
  end
end
