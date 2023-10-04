Rails.application.routes.draw do
  
  namespace :api do #defaults: {format: :json} do gotta check this out for routing purpose
    
    devise_for :users #, controllers: { sessions: "api/sign_in", registrations: "api/loging" }

    get 'sign_in', to: 'registration#create_user'
    post 'sign_in', to: 'registration#create_user'
    get 'log_in', to: 'sessions#create_token'
    post 'log_in', to: 'sessions#create_token'
    delete 'log_out', to: 'sessions#destroy_token'

    #Root path route ("/")
    root "tweets#web"

    #----------------------------------------------------------------------------------------------------------  
    #Definition of the routes for managing user paths
      
    #common path
    resources :tweets, only: [:index, :create, :update, :destroy] do
      
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
      resources :users, only: [:create, :destroy, :show] do
        
        #personalized path
        member do
          get 'tweets',    to: 'users#tweets',   as: 'tweets'
          get 'tweets_replies',   to: 'users#tweets_replies',   as: 'tweets_replies'
        end
    end
  end
end
