require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe 'GET index' do
    it 'should assign all tasks to @tasks' do
      tasks = Task.create(title:"Monday", content:"Wear new clothes")
      get :index
      expect(assigns(:tasks)).to eq [tasks]
    end
  end

  describe 'Tasks are sorted by created_at desc' do
    before(:each) do
      @task1 = Task.create(id: 1, title: "tast1", created_at: Time.now)
      @task2 = Task.create(id: 2, title: "task2", created_at: Time.now - 3.hours)
    end
    it 'Whether created_at are sorted in desc' do
      expect(Task.all.order(created_at: :desc).map(&:id)).to eq [1, 2]
    end
  end

  describe "GET new" do
    it "should assign a new task to @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "should create a task" do
        valid_task_params = {title: "Tuesday", content: "Hungry"}
        expect {
          post :create, params: {task: valid_task_params} 
        }.to change(Task, :count).by(1)
      end
      it "should redirect to task" do
        valid_task_params = {title: "Tuesday", content: "Hungry"}
        post :create, params: {task: valid_task_params} 
        expect(response).to redirect_to Task.last
      end
    end

    context "with invalid params" do
      it "should not create a task" do
        invalid_task_params = {title: "", content: "Hungry"}
        expect {
          post :create, params: {task: invalid_task_params} 
        }.not_to change(Task, :count)
      end
      it "should render new template" do
        invalid_task_params = {title: "", content: "Hungry"}
        post :create, params: {task: invalid_task_params} 
        expect(response).to render_template(:new)
      end
    end
  end
    
  describe "GET show" do
    it "should assign task to @task" do
      task = Task.create(title:"Wednesday", content:"Mountaineering")  
      get :show, params: { id: task.id }
      expect(assigns(:task)).to eq task 
    end
  end

  describe "PUT update" do
    let(:task) { Task.create(title: "Thursday", content: "Test") }

    context "with valid params" do
      it "should update task's attributes" do
        valid_task_params = {title: "Friday", content: "Dance" }
        put :update, params: { id: task.id, task: valid_task_params}
        task.reload
        expect(task.title).to eq valid_task_params[:title]
      end
      it "should redirect to show page" do
        valid_task_params = {title: "Friday", content: "Dance" }
        put :update, params: { id: task.id, task: valid_task_params}
        expect(response).to redirect_to(task)
      end
    end
    
    context "with invalid params" do
      it "should not update task's attributes" do
        invalid_task_params = {title: "", content: "BBQ"}
        put :update, params: {id: task.id, task: invalid_task_params}
        task.reload
        expect(task.content).not_to eq invalid_task_params[:content]
      end
      it "should render edit template" do
        invalid_task_params = {title: "", content: "BBQ"}
        put :update, params: {id: task.id, task: invalid_task_params}
        expect(response).to render_template(:edit)
      end
    end 
  end

  describe "DELETE destroy" do
    let!(:task) { Task.create(title: "Sunday", content: "Birthday") } 

    it "should delete a task" do
       expect {
        delete :destroy, params: {id: task.id}
       }.to change(Task, :count).by(-1)
    end

    it "should redirect to index page" do
      delete :destroy, params: {id: task.id}
      expect(response).to redirect_to(tasks_url)
    end
  end
  
end