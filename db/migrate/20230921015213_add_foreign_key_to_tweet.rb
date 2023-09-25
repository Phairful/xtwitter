class AddForeignKeyToTweet < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tweets, :users, column: :tweeting_user_id

  end
end
