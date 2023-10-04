class Api::ApiController < ApplicationController 
    skip_before_action :verify_authenticity_token

    before_action :set_default_format
    before_action :authenticate_user!
  
    def render_response(view_name)
      respond_to do |format|
        format.json { render view_name, status: :ok, location: @tweet }
      end
    end
  
    def authenticate_user!
      payload = JsonWebToken.decode(auth_user)
        @current_user = User.find(payload["sub"])
        p @current_user
      rescue JWT::ExpiredSignature
        render json: {errors: ["Expired credentials for User"]}, status: :unauthorized
      rescue JWT::DecodeError
        render json: {errors: ["Wrong credentials for User"]}, status: :unauthorized
    end

    private
    def auth_user
      @auth_user ||= request.headers.fetch("Authorization", "").split(" ").last
    end 


    def set_default_format
      request.format = :json
    end

    def render_errors(instance)
      @errors = instance.errors
      @klass = instance.class
      render 'shared/errors', status: :unprocessable_entity
    end

end