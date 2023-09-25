class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.integer :bookmarked_tweet_id
      t.integer :bookmarking_user_id

      t.timestamps
    end
  end
end
