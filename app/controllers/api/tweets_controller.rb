class Api::TweetsController < ApiController
     
    
    def index
        @tweets = Tweet.all
        render_response('api/tweets/index')
    end
    
    def create
        request = params
        @tweet = create_new(request)
        render_response('api/tweets/show')
    end
    
    def update
        request = params
        @tweet = update_model(request)
        render_response('api/tweets/show')
    end
    
    def stats
        request = params
        @statistics = get_data(request)
        render_response('api/tweets/stats')
    end
    
    def create_bookmark
        request = params
        @bookmark = save_bookmark(params)
        render_response('api/tweets/bookmark')
    end
    
    private
    
    def tweet_params
        params.require(:tweet).permit(:tweet_body, :user_id, :reply_at_tweet_id)
    end

end