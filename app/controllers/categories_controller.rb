class CategoriesController < ApplicationController
	
	before_filter :find_category, only: [:update, :destroy, :edit, :show]
  
  def index
    @categories = []
    current_user.categories_order.each do |id|
      @categories << current_user.categories.find(id)
    end
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

  def autocomplete_categories
    @categories = Category.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @categories.map(&:name)    
  end

	private
	  def find_category
	  	@category = Category.find_by_id(params[:id])
	  end
end