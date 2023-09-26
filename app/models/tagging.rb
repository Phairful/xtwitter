# == Schema Information
#
#create_table "taggings", force: :cascade do |t|
#  t.integer "hashtag_id"
#  t.integer "tweet_id"
#  t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
#----------------------------------------------------------------------------------------------------------

class Tagging < ApplicationRecord
  belongs_to :hashtag, class_name: "Hashtag"
  belongs_to :tweet, class_name: "Tweet"

#----------------------------------------------------------------------------------------------------------

  #created the association validation for the relations between tables hashtag & tweet to follower
  validates_associated :hashtag, :tweet
end
