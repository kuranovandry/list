class TasksController < ApplicationController
	before_filter :find_task, only: [:update, :destroy, :edit, :show]
	def index
		
	end
	def show
    
  end
  def new
    @task = Task.new
    render :new
  end
  def create
  	@task = Task.new(params[:task])
    @task.category_id = current_user.category_id
  	if @task.save 
  		redirect_to task_index_path
  	else 
  		render :new
  	end
  end
  def update
  	if @task.update_attributes(params[:task])
  		redirect_to task_path
  	else
  		render :edit
  	end
  end

  def edit
  	
  end

  def destroy
  	@task.destroy
  	redirect_to task_index_path
  end

	private
	  def find_task
	  	@task = Task.find_by_id(params[:id])
	  end
end
