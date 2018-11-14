class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @states = Task.states
    @tasks = Task.order(created_at: :desc).page(params[:page]).per(5)
    if params[:type] == "build"
      @tasks = Task.order(created_at: :asc).page(params[:page]).per(5) 
    elsif params[:type] == "end"
      @tasks = Task.order(deadline: :asc).page(params[:page]).per(5)
    elsif params[:type] == "pry"
      @tasks = Task.order(priority: :asc).page(params[:page]).per(5)
    elsif params[:search]
      @tasks = Task.where('title LIKE ?', "%#{params[:search]}%").page(params[:page]).per(5)
    elsif params[:state] == "0"
      @tasks = Task.where('state = 0', "%#{params[:state]}%").page(params[:page]).per(5)
    elsif params[:state] == "1"
      @tasks = Task.where('state = 1', "%#{params[:state]}%").page(params[:page]).per(5)
    elsif params[:state] == "2"
      @tasks = Task.where('state = 2 ', "%#{params[:state]}%").page(params[:page]).per(5)
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
    params.require(:task).permit(:title, :content, :deadline, :state, :priority)
  end

end
