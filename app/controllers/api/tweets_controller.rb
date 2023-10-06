class Api::TweetsController < Api::BaseController
    include TweetData
    before_action :set_default_format
    before_action :set_tweet, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: [:web]
    
    def web #move to another controller homepage for /root
        @tweets = Tweet.all
        render_response('tweets/web')
    end



#api_tweets POST   /api/tweets(.:format)                                                                             api/tweets#create    
def create
    @tweet = Tweet.new(tweet_params)
    @tweet = current_user.tweets.new(content: params[:tweet][:content])

    unless @tweet.save
      render json: { errors: @tweet.errors.full_messages }, status: :unprocessable_entity
    end
  end
    

#api_tweet PATCH  /api/tweets/:id(.:format)                                                                         api/tweets#update    
    def update
        @tweet = Tweet.find(params[:id])
        request = params[:id]
        @tweet = update_model(request)
        render_response('tweets/show')
    end

#DELETE /api/tweets/:id(.:format)                                                                         api/tweets#destroy    
    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        flash[:success] = "The tweet was deleted"
        redirect_to tweet_url
        render_response('tweets/show')
    end

#spec_api_tweet GET    /api/tweets/:id/spec(.:format)                                                                    api/tweets#spec
    def spec
        request = params[:id]
        @statistics = get_data(request)
        render_response('tweets/show')
    end

#like_api_tweet POST   /api/tweets/:id/like(.:format)                                                                    api/tweets#like
    def like
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

#unlike_api_tweet DELETE /api/tweets/:id/unlike(.:format)                                                                  api/tweets#unlike
    def unlike
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

#retweet_api_tweet POST   /api/tweets/:id/retweet(.:format)                                                                 api/tweets#retweet
    def retweet
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

#quote_api_tweet POST   /api/tweets/:id/quote(.:format)                                                                   api/tweets#quote
    def quote
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

#reply_api_tweet GET    /api/tweets/:id/reply(.:format)                                                                   api/tweets#reply
    def reply
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

#bookmark_api_tweet POST   /api/tweets/:id/bookmark(.:format)                                                                api/tweets#bookmark
    def bookmark
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

    
    private
    def set_tweet
        @tweet = Tweet.find(params[:id])
    end

    def tweet_params
        params.require(:tweet).permit(:tweet_body, :user_id, :reply_at_tweet_id)
    end

end