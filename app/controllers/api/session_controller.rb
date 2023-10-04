class Api::SessionsController < Api::ApiController
    skip_before_action :authenticate_user!

    def create_credentials
        email = params[:email]
        password = params[:password]
        token = create_credentials(email, password)
        render_response(new, status: :ok)
    end
      
    def destroy_credentials
        id = params[:id]
        user = User.find(id)
        user.update(jwt_token: '')
        if user.jwt_token.empty?
        render_response(json: { }, status: :no_content)
        else
        render_response(json: { }, status: :conflict)
        end
    end
      
    def create_credentials(email, password)
        token = Api::AuthenticationController.new
        token = token.create(email, password)
        token
    end
      
    private
      
    def user_params
        params.require(:user).permit(:email, :password)
    end
end