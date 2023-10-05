json.tweet do
    json.partial! @tweet, partial: 'api/tweets/tweet', as: :tweet
  end
