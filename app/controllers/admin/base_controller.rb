class Admin::BaseController < ApplicationController
  before_action :authorize
  before_action :authenticate_admin
  
  def authenticate_admin
    unless current_user.admin?
      render file: "#{Rails.root}/app/views/errors/not_found", status: :not_found 
    end
  end
  
end