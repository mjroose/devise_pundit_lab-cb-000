class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || notes_path || root_path
    end

    def user_not_authorized(exception)
      flash[:alert] = "Access denied."
      redirect_to '/'
    end
end
