class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order(created_at: :asc)
  end

  # GET /tweets/1 or /tweets/1.json
  def show
    @tweet
    respond_to do |format|
        format.html {render :show}
        format.json { render :show, status: :ok, location: @tweet }
    end
  end


  # GET /tweets/new
  #def new
  #  @tweet = Tweet.new
  #end

  # GET /tweets/1/edit
  #def edit
  #end


  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:success] = "New tweet successfully created!"
      format.html { render :new}
      format.json { render :show, status: :created, location: @tweet }
    else
      flash.now[:error] = "tweet creation failed"
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @tweet.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(params.require(:tweet).permit(:tweet_body, :user_id, :reply_at_tweet_id))
      flash[:success] = "Tweet updated!"
      redirect_to todo_url(@tweet)
      format.html { render :new}
      format.json { render :show, status: :created, location: @tweet }
    else
      flash.now[:error] = "tweet update failed"
      render :edit
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
    @like=Like.new(tweet_id: @tweet, user_id: :user)
    #@tweet
    respond_to do |format|
      format.html { redirect_to tweets_url}
      format.json { render :show, status: :created, location: @like }
    end
  end

  def unlike
    @tweet.unlike
    respond_to do |format|
      format.html { redirect_to tweets_url}
      format.json { render :show}
    end
  end

  def retweet
    #@retweet=Retweet.new(tweet_id: @tweet.id, user_id: :user)
    #@tweet.retweet
    respond_to do |format|
      format.html { redirect_to tweets_url}
      format.json { render :show, status: :created, location: @tweet }
    end
  end

  def quote
    #@like=Quote.new(tweet_id: @tweet.id, user_id: :user, quote_body: )
    #@tweet.quoting
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { render :show, status: :created, location: @tweet }
    end
  end

  def reply
    @tweet
    #@reply = Tweet.New (tweet_id: @tweet.id, user_id: :user, reply_at_tweet_id:@tweet )
    #@tweet = @reply
    respond_to do |format|
      if @tweet.save!
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def bookmark
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
