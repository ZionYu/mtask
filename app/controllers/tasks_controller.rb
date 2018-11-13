class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.order(created_at: :desc)
    if params[:type] == "build"
      @tasks = Task.order(created_at: :asc)
    elsif params[:type] == "end"
      @tasks = Task.order(deadline: :asc)
    end
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "任務新增成功"
      redirect_to task_path(@task)
    else
      flash[:alert] = "任務新增失敗"
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "任務更新成功"
      redirect_to task_path(@task)
    else
      flash[:alert] = "任務更新失敗"
      render :edit
    end
    

  end

  def destroy
    @task.destroy
    redirect_to tasks_path
    flash[:notice] = '任務已刪除'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline)
  end

end
