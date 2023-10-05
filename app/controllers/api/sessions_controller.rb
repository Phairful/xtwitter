class Api::SessionsController < Api::BaseController
    before_action :set_default_format
    #skip_before_action :authenticate_api_user!
    
    #new_api_user_session GET   /api/users/sign_in(.:format)   api/sessions#new
    def new_login
        email = params[:email]
        password = params[:password]
        token = create_login(email, password)
        render json: { token: token }
      end

    #api_user_session POST      /api/users/sign_in(.:format)   api/sessions#create      
      def create_login(email, password)
        token = Api::AuthenticationController.new
        token.create_token(email, password)
      end
      

    #destroy_api_user_session DELETE    /api/users/sign_out(.:format)      api/sessions#destroy 
    def destroy_logout
        user = User.find(id)
        user.update(jwt: '')
        if user.jwt_token.empty?
        render_response(json: { }, status: :no_content)
        else
        render_response(json: { }, status: :conflict)
        end
    end

      
    private
      
    def user_params
        params.require(:user).permit(:email, :password)
    end
end