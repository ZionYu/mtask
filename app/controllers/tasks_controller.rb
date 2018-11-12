class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task was created successfully."
      redirect_to task_path(@task)
    else
      flash[:alert] = "Task was failed to create!"
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task was updated successfully."
      redirect_to task_path(@task)
    else
      flash[:alert] = "Task was failed to update!"
      render :edit
    end
    

  end

  def destroy
    @task.destroy
    redirect_to tasks_path
    flash[:notice] = 'Task was deleted'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content)
  end

end
