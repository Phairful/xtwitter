class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :liked_tweet_id
      t.integer :liking_user_id

      t.timestamps
    end
  end
end
