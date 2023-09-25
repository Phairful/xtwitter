class AddForeignKeyToBookmark < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookmarks, :tweets, column: :bookmarked_tweet_id
    add_foreign_key :bookmarks, :users, column: :bookmarking_user_id
    #add FK to table:  from table: , that is column:
  end
end
