Rails.application.routes.draw do
  resources :tweets

  #Define your application routes per the DSL in 
  #https://guides.rubyonrails.org/routing.html

#Root path route ("/")
root "tweets#index"

#----------------------------------------------------------------------------------------------------------  
  #Definition of the routes for managing user paths
  #common path
  resources :tweets, only: [:create, :update, :destroy, :show] do
  #personalized path
    member do
      post 'like',    to: 'tweets#like',    as: 'like'
      delete 'unlike', to: 'tweets#unlike',  as: 'unlike'
      post 'retweet',  to: 'tweets#retweet',  as: 'retweet'
      post 'quote',    to: 'tweets#quote',    as: 'quote'
      get 'reply',     to: 'tweets#reply',    as: 'reply'
      post 'bookmark', to: 'tweets#bookmark', as: 'bookmark'

    end
  end

#----------------------------------------------------------------------------------------------------------  
  #Definition of the routes for managing user paths
  #common path
  resources :users, only: [:index , :create, :destroy, :show] do
    #personalized path
    member do
      get 'tweets',    to: 'users#tweets',   as: 'tweets'
      get 'tweets_replies',   to: 'users#tweets_replies',   as: 'tweets_replies'
    end
  end
end
