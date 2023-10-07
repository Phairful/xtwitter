Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations'}

  #Root path route ("/") will be remade into a home controller
  root "tweets#root"


    #this are all my HTML routes for views.
    #common path
    
    resources :tweets, only: [:create, :update, :destroy, :show, :new, :edit, :index] do
      #personalized path
      member do
        get 'spec', to: 'tweets#spec',  as: 'spec'
        post 'like',    to: 'tweets#like',    as: 'like'
        delete 'unlike', to: 'tweets#unlike',  as: 'unlike'
        post 'retweet',  to: 'tweets#retweet',  as: 'retweet'
        post 'quote',    to: 'tweets#quote',    as: 'quote'
        get 'reply',     to: 'tweets#see_reply',    as: 'show_reply'
        post 'reply',     to: 'tweets#reply',    as: 'reply'
        post 'bookmark', to: 'tweets#bookmark', as: 'bookmark'

      end
    end

    #----------------------------------------------------------------------------------------------------------  
    #Definition of the routes for managing user paths
    #common path
    resources :users, only: [:show] , param: :username do
      #personalized path
      member do
        get 'tweets(/page/:page)',    to: 'users#tweets',   as: 'tweets' 
        get 'tweets_replies(/page/:page)',   to: 'users#tweets_replies',   as: 'tweets_replies'
      end
    end



  #----------------------------------------------------------------------------------------------------------  
  
  #this are all the api routes for JSON rendering. 
  namespace :api do 

    #Definition of the routes for managing user paths
    post 'registration' , to: "registration#create_user"
    get 'registration' , to: "registration#create_user"
    post 'registration' , to: "registration#create_credentials"
    get 'sessions' , to: "sessions#new_login"
    post 'sessions' , to: "sessions#create_login"
    delete 'sessions' , to: "sessions#destroy_logout"
      
    #common path for tweets routes
    resources :tweets, only: [:create, :update, :destroy] do
      
      #personalized path for tweets routes
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
      
    #common path for users routes
    resources :users, only: [:show] do
        
      #personalized path for users routes
      member do
        get 'tweets(/page/:page)',    to: 'users#tweets',   as: 'tweets'
        get 'tweets_replies(/page/:page)',   to: 'users#tweets_replies',   as: 'tweets_replies'
      end
    end
  end
end
