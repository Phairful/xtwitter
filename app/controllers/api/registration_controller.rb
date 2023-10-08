class Api::RegistrationController < Api::BaseController
  skip_before_action :authenticate_user!
  
  
  #new_api_user_registration GET    /api/users/sign_up(.:format)                                                                      api/registration#new
  def create_user
    attributes = self.format_params(params)
    @user = User.new(attributes)
    @user.save!
    @token = create_credentials(@user.email, attributes[:password])
    render_response('registration/new')
  end

  #
  def create_credentials(email, password)
    token = Api::AuthenticationController.new
    token.create_token(email, password)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password
    )
  end
  
  def format_params(params)
    attributes = {
      username: params[:username],
      email: params[:email],
      password: params[:password]
    }
    attributes
  end

end