class TasksController < ApplicationController
	before_filter :find_task, only: [:update, :destroy, :edit, :show]
  	
  def index
		@tasks = current_user.tasks
	end
	
  def show
    
  end
  
  def new
    @categories = current_user.categories
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id
  	if @task.save 
  		redirect_to tasks_path
  	else 
      @categories = current_user.categories
  		render :new
  	end
  end
  
  def update
  	if @task.update_attributes(params[:task])
  		redirect_to tasks_path
  	else
      @categories = current_user.categories
  		render :edit
  	end
  end

  def edit
  	@categories = current_user.categories
    
  end

  def destroy
  	@task.destroy
  	redirect_to tasks_path
  end

	private
	  def find_task
	  	@task = Task.find_by_id(params[:id])
	  end
end