class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
  
  def not_found
    render file: "#{Rails.root}/app/views/errors/not_found", status: 404
  end 
  
end
