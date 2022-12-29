class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
    end

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

    def user_cart
      if user_signed_in?
          if params[:user_id]
          @user = User.find(params[:user_id])
          end
      end
    end

    def cart_count
      if user_signed_in?
        @user = User.find(current_user.id)
      end
    end

end
