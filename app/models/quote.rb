# == Schema Information
#
#create_table "quotes"
#
#  t.string "quote_body"#
# t.integer "user_id"
# t.integer "tweet_id"
# t.integer "tweet_quote_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false#
#----------------------------------------------------------------------------------------------------------
class Quote < ApplicationRecord
  belongs_to :tweet, class_name: "Tweet"
  belongs_to :user, class_name: "User"

#----------------------------------------------------------------------------------------------------------

  #created the validation for having text body in a quote
  validates :quote_body, 
    length: {within: (1..255)}, 
    presence: { message: "must be given please" }
  
  #created the association validation for the relations between tables user & tweet to quote
  validates_associated :tweet_id, :user_id
end
