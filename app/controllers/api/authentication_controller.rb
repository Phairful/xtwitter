class Api::AuthenticationController < Api::ApiController
    skip_before_action :authenticate_user!

    def create
        user = User.find_by(email: params[:user][:email])
        if user.valid_password? params[:user][:email]
            render json: { token: JsonWebToken.encode(sub: user.id)}
        else
            render json: {errors: ["Invalid email or password"]}
        end
    end
end