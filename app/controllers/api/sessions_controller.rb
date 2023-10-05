class Api::SessionsController < Api::BaseController
    before_action :set_default_format
    #skip_before_action :authenticate_user!

    def new
        email = params[:email]
        password = params[:password]
        token = create(email, password)
        render_response(new, status: :ok)
    end
      
    def destroy
        user = User.find(id)
        user.update(jwt_token: '')
        if user.jwt_token.empty?
        render_response(json: { }, status: :no_content)
        else
        render_response(json: { }, status: :conflict)
        end
    end
      
    def create(email, password)
        token = Api::AuthenticationController.new
        token = token.create(email, password)
        token
    end
      
    private
      
    def user_params
        params.require(:user).permit(:email, :password)
    end
end