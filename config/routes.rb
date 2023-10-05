Rails.application.routes.draw do
  devise_for :users
  namespace :api do 
    
    #Root path route ("/") will be remade into a home controller
     root "tweets#web"

    #----------------------------------------------------------------------------------------------------------  
    #Definition of the routes for managing user paths
      post 'registration' , to: "registration#create_user"
      get 'registration' , to: "registration#create_user"
      post 'registration' , to: "registration#create_credentials"
      get 'sessions' , to: "sessions#new_login"
      post 'sessions' , to: "sessions#create_login"
      delete 'sessions' , to: "sessions#destroy_logout"
      
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
