class ApplicationController < ActionController::Base
end
class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
  
    protected
  
    def render_to_json(arguments)
      if arguments.class == Array then
      data, status_code = arguments
      else
        data = arguments
        status_code = 200
      end
  
      render :json => data, status: status_code
    end
  end