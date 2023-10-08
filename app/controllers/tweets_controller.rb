class TweetsController < ApplicationController
  include TweetData
  before_action :set_tweet, only: %i[show edit update destroy]

  # GET /tweets or /tweets.json
  def root
    if user_signed_in?
      redirect_to action: "index"
    else
      @tweets = Tweet.order("RANDOM()").limit(10)
      render_response('tweets/index')
    end
   
  end

  # def index
  #   @tweets = current_user.tweets_user.order(created_at: :desc)
  #   @tweets = current_user.followee_user.includes(:tweets).map(&:tweets).flatten
  #   #@tweets = @tweets.order(created_at: :desc)
  #   render_response('tweets/index')
  # end
    

  def index
    if user_signed_in?
      user_tweets = Tweet.user_tweets(current_user.id)
      #user_tweets = current_user.tweets_user.order(created_at: :desc)
      followee_tweets = current_user.followee_user.includes(tweets: :user).map(&:tweets).flatten
  
      # Combine user's tweets and followee's tweets into one array and sort by created_at
      @tweets = (user_tweets + followee_tweets).sort_by(&:created_at).reverse
    else
      @tweets = Tweet.order("RANDOM()").limit(10)
    end
  
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



  #GET /tweets/new
  def new
   @tweet = Tweet.new
  end

  #GET /tweets/1/edit
  
  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end


  def create
    @tweet = current_user.tweets.build(tweet_params)
  
    if @tweet.save
      flash[:success] = "New tweet successfully created!"
      redirect_to root_path
    else
      flash.now[:error] = "Tweet creation failed"
      render 'tweets/index'
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

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: "Tweet created successfully."
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:success] = "The tweet was deleted"
    redirect_to tweets_url
  end

  def destroy_like
    @tweet = Tweet.find(params[:id])
    @like = Like.find_by(tweet_id: @tweet.id, user_id: current_user.id)
    
    if @like
      @like.destroy
      flash[:success] = "Your like was removed"
    else
      flash[:error] = "You haven't liked this tweet"
    end

    redirect_to tweet_path(@tweet)
  end

  def like
    @tweet = Tweet.find(params[:id])
    @like = Like.new(tweet: @tweet, user: current_user)

    if @like.save
      flash[:success] = "You liked the tweet"
    else
      flash[:error] = "There was an error liking the tweet"
    end

    redirect_to tweet_path(@tweet)
  end

  def unlike
    @tweet = Tweet.find(params[:id])
    @like = Like.find_by(tweet_id: @tweet.id, user_id: current_user.id)
    
    if @like
      @like.destroy
      flash[:success] = "You unliked the tweet"
    else
      flash[:error] = "You haven't liked this tweet"
    end

    redirect_to tweet_path(@tweet)
  end

  def retweet
    @tweet = Tweet.find(params[:id])
    @retweet=Retweet.new(tweet: @tweet, user: current_user)
    if
      flash[:success] = "You liked the tweet"
    else
      flash[:error] = "There was an error liking the tweet"
    end
      redirect_to tweet_path(@tweet)
  end

  def quote
    @tweet = Tweet.find(params[:id])
    @Retweet=Retweet.new(tweet_id: @tweet.id, user_id: :user)
    respond_to do |format|
      format.html { redirect_to tweet_path, notice: "Tweet was successfully destroyed." }
    end
  end

  def reply
    original_tweet = Tweet.find(params[:id])
    # = current_user 

    @reply = Tweet.new(user_id: current_user.id , tweet_body: tweet_params[:tweet_body], reply_at_tweet_id: original_tweet.id)
  
    respond_to do |format|
      if @reply.save
        format.html { redirect_to tweet_url(original_tweet), notice: "Reply was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  

  def bookmark
    @tweet = Tweet.find(params[:id])
    @bookmark=Bookmark.new(tweet: @tweet, user: current_user)
    if @bookmark.save
      flash[:success] = "You bookmarked the tweet"
    else
      flash[:error] = "There was an error bookmark the tweet"
    end

    redirect_to tweet_path(@tweet)
    end

   def following
    @tweets = current_user.followed_users.includes(:tweets).map(&:tweets).flatten
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