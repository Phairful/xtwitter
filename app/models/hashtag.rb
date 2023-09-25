class Hashtag < ApplicationRecord
    #created the validadtion for hashtag gotta have a body
    validates :hashtag_body, 
        presence: { message: "must be given please" }, 
        length: {within: (1...255)}
end
