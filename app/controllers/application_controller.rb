class ApplicationController < ActionController::Base

    protected
    def after_sign_in_path_for(resource)
      if current_user.role_id == 1
        categories_path
      else
        root_path
      end
    end

    def admin_access
      if current_user.role_id == 2
          flash[:error] = "You are not allowed to have access to this page."
        redirect_to root_path
      end
    end

end
