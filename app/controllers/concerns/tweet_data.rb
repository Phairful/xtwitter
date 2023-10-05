module TweetData
    extend ActiveSupport::Concern
  
      def get_data(tweet)
          id = tweet.id
  
          stats = {
              retweets: self.get_retweets(id).count,
              quotes: self.get_quotes(id).count,
              likes: self.get_likes(id).count,
              bookmarks: self.get_bookmarks(id).count,
          }
  
          { "tweet_#{id}" => stats }
      end
  
      private
  
      def get_retweets(id)
        Retweet.where(tweet_id: id)
      end
  
      def get_quotes(id)
        Quote.where(tweet_id: id)
      end
  
      def get_likes(id)
        Like.where(tweet_id: id)
      end
  
      def get_bookmarks(id)
        Bookmark.where(tweet_id: id)
      end
  end