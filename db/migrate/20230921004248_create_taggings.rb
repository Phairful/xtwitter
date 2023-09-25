class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.integer :tagged_hashtag_i
      t.integer :tagged_tweet_id

      t.timestamps
    end
  end
end
