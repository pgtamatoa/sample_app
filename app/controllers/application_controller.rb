class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  include SessionsHelper

  def record_not_found
    render plain: "404 Not Found", status: 404
  end

  def redirect_guest_user
    redirect_to login_path, flash: { error: "You must be logged in to access this section" }
  end

end
