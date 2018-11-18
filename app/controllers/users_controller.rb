class UsersController < ApplicationController
  skip_before_action :authorize

  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end  

  def task
    @user = User.find(params[:id])
    @tasks = @user.tasks.page(params[:page]).per(6)
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
