Rails.application.routes.draw do
  
  namespace :api do 
    devise_for :users, controllers: { registrations: 'api/registration' , sessions: "api/sessions"}
    #Root path route ("/")
     "tweets#web"
dfsdfsdf
    #----------------------------------------------------------------------------------------------------------  
    #Definition of the routes for managing user paths
      
    #common p
    resources :tweets, only: [:create, :update, :destroy] do
      
      #personalized path
      member do
        get 'spec', to: 'tweets#spec',  as: 'spec'
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
      resources :users, only: [:show] do
        
        #personalized path
        member do
          get 'tweets(/page/:page)',    to: 'users#tweets',   as: 'tweets'
          get 'tweets_replies(/page/:page)',   to: 'users#tweets_replies',   as: 'tweets_replies'
        end
    end
  end
end
