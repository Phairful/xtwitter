Rails.application.routes.draw do
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Root path route ("/")
root "xwitter#index"

# Define routes for managing tweets
  resources :tweets, only: [:new, :create, :edit, :update] do
   
  member do
    post 'like',    to: 'tweets#like',    as: 'like_tweet'
    delete 'unlike', to: 'tweets#unlike',  as: 'unlike_tweet'
    post 'retweet',  to: 'tweets#retweet',  as: 'retweet_tweet'
    post 'quote',    to: 'tweets#quote',    as: 'quote_tweet'
    get 'reply',     to: 'tweets#reply',    as: 'reply_tweet'
    post 'bookmark', to: 'tweets#bookmark', as: 'bookmark_tweet'

   end
  end
end
