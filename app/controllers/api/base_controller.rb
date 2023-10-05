class Api::BaseController < ApplicationController 
    before_action :set_default_format
    before_action :authenticate_user!
    #skip_before_action :verify_authenticity_token
  
    def render_response(view_name)
      respond_to do |format|
        format.json { render view_name }
      end
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