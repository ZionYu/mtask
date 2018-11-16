class Admin::BaseController < ApplicationController
  before_action :authorize
  before_action :authenticate_admin

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path
      flash[:alert] = "You are not admin!"  
    end
  end
end