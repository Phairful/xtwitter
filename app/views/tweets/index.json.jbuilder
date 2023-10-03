json.array! @tweets do |tweet|
    json.id tweet.id
    json.tweet_body tweet.tweet_body
    json.user_id tweet.user_id
    json.reply_at_tweet_id tweet.reply_at_tweet_id
    json.updated_at tweet.updated_at
#puede que esto no sirva
    json.tweet do
      json.partial! "tweets/tweet", as: :tweet
    end
#hasta aca pero lo otro deberia de estar masob bine ig
  end