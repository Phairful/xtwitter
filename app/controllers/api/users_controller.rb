class Api::UsersController < Api::BaseController
    before_action :set_default_format
    before_action :authenticate_user!

    def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username, :display_name, :email, :password, :bio, :location)
      end


  # GET /users/1 or /users/1.json
  def show

  end

  # GET /users/1/edit 
  def edit
      #returns a html 
  end

  # PATCH/PUT /users/1 or /users/1/.json
  def update
      respond_to do |format|
          if @user.update(user_params)
              #format.html { redirect_to user_url(@user), notice: "User was successfully updated."}
              format.json { render :show, status: :ok, location: @user }
          else
              #format.html { render :edit, status: :unprocessable_entity}
              format.json { render json: @user.errors, status: :unprocessable_entity }
          end
      end
  end
end