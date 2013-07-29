class CategoriesController < ApplicationController
	
	before_filter :find_category, only: [:update, :destroy, :edit, :show]
  
  def index
    @categories = current_user.categories
    @category = Category.new
  end
  
  def show
    @tasks = @category.tasks
  end
  
  def new
    @category = Category.new
  end

  def create
    respond_to do |format|
      @category = Category.new(params[:category])
      @category.user_id = current_user.id
    	if @category.save 
        format.js
        format.html { redirect_to categories_path }
    	else 
    		render :new
    	end
    end 
  end

  def update
  	if @category.update_attributes(params[:category])
  		redirect_to categories_path
  	else
  		render :edit
  	end
  end

  def edit
  end

  def destroy
    @category.destroy
  end

	private
	  def find_category
	  	@category = Category.find_by_id(params[:id])
	  end
end