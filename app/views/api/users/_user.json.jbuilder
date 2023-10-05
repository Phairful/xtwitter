
json.extract! @user, :id, :username, :display_name, :email, :password, :bio, :location, :created_at, :updated_at
#json.url api_user_url(user, format: :json)