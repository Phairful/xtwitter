# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_21_015213) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.integer "bookmarked_tweet_id"
    t.integer "bookmarking_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_user_id"
    t.integer "followee_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "hashtag_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "liked_tweet_id"
    t.integer "liking_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.string "quote_body"
    t.integer "quoting_user_id"
    t.integer "quoted_tweet_id"
    t.integer "tweet_quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "retweets", force: :cascade do |t|
    t.integer "retweed_tweet_id"
    t.integer "retweeting_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tagged_hashtag_i"
    t.integer "tagged_tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string "tweet_body", limit: 280
    t.integer "tweeting_user_id"
    t.integer "reply_at_tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 20
    t.string "display_name", limit: 20
    t.string "email"
    t.string "password"
    t.string "bio"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookmarks", "tweets", column: "bookmarked_tweet_id"
  add_foreign_key "bookmarks", "users", column: "bookmarking_user_id"
  add_foreign_key "follows", "users", column: "followee_user_id"
  add_foreign_key "follows", "users", column: "follower_user_id"
  add_foreign_key "likes", "tweets", column: "liked_tweet_id"
  add_foreign_key "likes", "users", column: "liking_user_id"
  add_foreign_key "quotes", "tweets", column: "quoted_tweet_id"
  add_foreign_key "quotes", "tweets", column: "tweet_quote_id"
  add_foreign_key "quotes", "users", column: "quoting_user_id"
  add_foreign_key "retweets", "tweets", column: "retweed_tweet_id"
  add_foreign_key "retweets", "users", column: "retweeting_user_id"
  add_foreign_key "taggings", "hashtags", column: "tagged_hashtag_i"
  add_foreign_key "taggings", "tweets", column: "tagged_tweet_id"
  add_foreign_key "tweets", "users", column: "tweeting_user_id"
end
