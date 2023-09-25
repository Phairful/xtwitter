class Tagging < ApplicationRecord
  belongs_to :hashtag, class_name: "Hashtag"
  belongs_to :tweet, class_name: "Tweet"

#----------------------------------------------------------------------------------------------------------

  #created the association validation for the relations between tables hashtag & tweet to follower
  validates_associated :hashtag, :tweet
end
