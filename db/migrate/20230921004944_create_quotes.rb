class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :quote_body
      t.integer :quoting_user_id
      t.integer :quoted_tweet_id
      t.integer :tweet_quote_id

      t.timestamps
    end
  end
end
