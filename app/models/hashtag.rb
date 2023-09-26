# == Schema Information
#
#   create_table "hashtags"
#
#    t.string "hashtag_body"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#----------------------------------------------------------------------------------------------------------


class Hashtag < ApplicationRecord
    has_many :taggings, foreign_key: "hashtag_id"

    #created the validadtion for hashtag gotta have a body
    validates :hashtag_body, 
        presence: { message: "must be given please" }, 
        length: {within: (1...255)}
        uniqueness: true
        
end
