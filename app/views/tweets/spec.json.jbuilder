json.tweet_statistics @statistics do
    json.quotes @statistics[:quotes]
    json.retweets @statistics[:retweets]
    json.likes @statistics[:likes]
    json.interactions @statistics[:interactions]
  end