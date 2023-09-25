class CreateRetweets < ActiveRecord::Migration[7.0]
  def change
    create_table :retweets do |t|
      t.integer :retweed_tweet_id
      t.integer :retweeting_user_id

      t.timestamps
    end
  end
end
