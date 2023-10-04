class Api::TweetsController < Api::ApiController
    include TweetData
    before_action :set_tweet, only: %i[show edit update destroy]
    before_action :authenticate_user!
    skip_before_action :authenticate_user! , only:[:index]
    
    def web #move to another controller homepage for /root
        @tweets = Tweet.all
        render_response('tweets/homepage')
    end

    def index
        @tweet = Tweet.new
        @tweets = Tweet.all.order(created_at: :asc)
        render_response('tweets/index')
    end
    
    def create
        @tweet = create_new(request) #try this
        @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        flash[:success] = "New tweet successfully created!"
        render_response('tweets/show')
      else
        flash.now[:error] = "tweet creation failed"
      end
    end
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        request = params[:id]
        @tweet = update_model(request)
        render_response('tweets/show')
    end
    
    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        flash[:success] = "The tweet was deleted"
        redirect_to tweet_url
        render_response('tweets/show')
    end

    def spec
        request = params[:id]
        @statistics = get_data(request)
        render_response('tweets/spec')
    end

    def like
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

    def unlike
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

    def retweet
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

    def quote
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

    def reply
        request = params[:id]
        #@bookmark = save_bookmark(params)
        render_response('tweets/spec')
    end

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