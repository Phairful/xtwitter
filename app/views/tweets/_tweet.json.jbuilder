json.extract! tweet, :id, :tweet_body, :user_id, :reply_at_tweet_id, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)

json.id tweet.id
json.name tweet.name
json.created_at tweet.created_at
