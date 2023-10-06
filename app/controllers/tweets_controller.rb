class TweetsController < ApplicationController
  include TweetData
  before_action :set_tweet, only: %i[show edit update destroy]

  # GET /tweets or /tweets.json
  def index
    #@tweet = Tweet.new
    #@current_user.following
    @tweets = Tweet.all.order(created_at: :asc)
    render_response('tweets/index')
end

  # GET /tweets/1 or /tweets/1.json
  def show
    @tweet
    respond_to do |format|
        format.html {render :show}
    end
  end
  def render_response(view_name)
    respond_to do |format|
      format.html { render view_name }
    end
  end



  # GET /tweets/new
  #def new
  #  @tweet = Tweet.new
  #end

  #GET /tweets/1/edit
  def edit
      @tweet = Tweet.find(params[:id])
      render :edit
      #respond_to do |format|
        #format.html { render :edit, locals: { question: question } }
      #end
  end


  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        flash[:success] = "New tweet successfully created!"
        format.html { redirect_to tweet_url(@tweet), notice: "tweet was successfully created."}
      else
        flash.now[:error] = "tweet creation failed"
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update 
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
        if @tweet.update(tweet_params)
          format.html { redirect_to tweets_url(@tweet), notice: "Tweet was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
  end


  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:success] = "The tweet was deleted"
    redirect_to tweet_url
  end

  def like
    @tweet = Tweet.find(params[:id])
    @like=Like.new(tweet_id: @tweet.id, user_id: :user)

    respond_to do |format|
      format.html { redirect_to spec_tweet}
    end
  end

  def unlike
    @tweet = Tweet.find(params[:id])
    like = Like.find_by(tweet_id: @tweet.id)
    like.delete
    respond_to do |format|
      format.html { redirect_to tweets_url}
    end
  end

  def retweet
    @tweet = Tweet.find(params[:id])
    @retweet=Retweet.new(tweet_id: @tweet.id, user_id: :user)

    respond_to do |format|
      format.html { redirect_to tweets_url}
    end
  end

  def quote
    @tweet = Tweet.find(params[:id])
    @Retweet=Retweet.new(tweet_id: @tweet.id, user_id: :user)
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
    end
  end

  def reply
    original_tweet = @tweet
    current_user = tweet_params[:user_id]

    #@quote_tweet = Tweet.new(user_id: current_user, content: tweet_params[:content], quote_id: original_tweet.id)
    @reply = Tweet.new(user_id: :user, tweet_body: tweet_params[:tweet_body], reply_at_tweet_id: @tweet.id)
    respond_to do |format|
      if @reply.save
        format.html { redirect_to tweet_url(@tweet), notice: "Reply was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def bookmark
    @tweet = Tweet.find(params[:id])
    @bookmark=Bookmark.new(tweet_id: @tweet.id, user_id: :user)

    respond_to do |format|
      format.html { redirect_to tweets_url}
    end
  end

#-------------------------------------------------------------------------------------------------------

  private
   
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:tweet_body, :user_id, :reply_at_tweet_id)
    end

  end