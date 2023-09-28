Rails.application.routes.draw do
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Root path route ("/")
root "xwitter#index"

# Define routes for managing tweets
  resources :tweets, only: [:create, :patch, :destroy, :show] do
   
  member do
    post 'like',    to: 'tweets#like',    as: 'like_tweet'
    delete 'unlike', to: 'tweets#unlike',  as: 'unlike_tweet'
    post 'retweet',  to: 'tweets#retweet',  as: 'retweet_tweet'
    post 'quote',    to: 'tweets#quote',    as: 'quote_tweet'
    get 'reply',     to: 'tweets#reply',    as: 'reply_tweet'
    post 'bookmark', to: 'tweets#bookmark', as: 'bookmark_tweet'

   end
  end

  resources :users, only: [:create, :destroy, :show] do
    
    member do
      get 'tweets',     to: 'users#tweets',    as: 'tweet_user'
      get 'tweets_replies',     to: 'users#tweets_replies',    as: 'tweets_replies_user'
    end
  end
end
