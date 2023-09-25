class AddForeignKeysToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :liking_user_id
    add_foreign_key :likes, :tweets, column: :liked_tweet_id
    #add FK to table:  from table: , that is column:
  end
end
