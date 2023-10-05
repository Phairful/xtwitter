# == Schema Information
#
#   create_table "follows"
#
#   t.integer "follower_user_id"
#   t.integer "followee_user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#----------------------------------------------------------------------------------------------------------


class Follow < ApplicationRecord
    belongs_to :follower_user, class_name: 'User'
    belongs_to :followee_user, class_name: 'User'

#----------------------------------------------------------------------------------------------------------

    #created the validation for only following one another per tweet per user
    validates :follower_user_id, uniqueness: { scope: :followee_user_id, message: "Has already been followed"}
    
    #created the association validation for the relations between tables user to follower
    validates_associated  :follower_user, :followee_user
end
