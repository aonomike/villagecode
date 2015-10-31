class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
	redirect_to root_url, :alert => exception.message
  end


  def require_user
    if current_user
        
    else
        redirect_to "/users/sign_up"
    end
  end
 
  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:name, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:name, :type,:email,:password, :password_confirmation,:current_password,:slug)
      end
  end 


end
