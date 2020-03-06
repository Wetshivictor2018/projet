class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
  
    before_action :set_cache_headers
  
    def after_sign_in_path_for(resource)
      formations_path
    end
  
    private
  
    #Fix bug of javascripts not running when browsing to previous page
    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
  

end
