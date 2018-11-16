class Admin::UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :destroy] 

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
