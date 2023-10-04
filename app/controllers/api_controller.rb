class ApiController < ApplicationController 
    skip_before_action :verify_authenticity_token

    before_action :set_default_format
    before_action :authenticate_user!
  
    def render_response(view_name)
      respond_to do |format|
        format.json { render view_name }
      end
    end
  
    private
  
    def set_default_format
      request.format = :json unless params[:format]
    end

end