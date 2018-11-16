class Admin::UsersController < Admin::BaseController
  
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
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def update
    if params[:commit] == "更新使用者"
      @user.update(user_params)
      if @user.save
        redirect_to admin_root_path
        flash[:notice] = "使用者資料已更新"
      else
        render :edit
      end 
    elsif params[:commit] == "Update"
      @user.update(role: params[:role])
      if @user.save
        redirect_to admin_users_path
        flash[:notice] = "使用者權限已更新"
      else
        flash[:alert] = "更新失敗"
        render :index
      end
    end
  end

  def destroy
    @user.destroy if User.where(role:"admin").count > 1
    flash[:alert] = "管理者剩1人不能刪除！"
    redirect_to admin_root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end
