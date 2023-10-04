class Api::UsersController < ApiController

    def index
        @users = Tweet.all
        render_response('api/tweets/index')
    end

    def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username, :display_name, :email, :password, :bio, :location)
      end
end