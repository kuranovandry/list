class CategoriesController < ApplicationController
	
	before_filter :find_category, only: [:update, :destroy, :edit, :show]
	
	def index
		@categories = Category.all
	end
	
	def show
		
	end
	
	def new
  	@category = Category.new
  	render :new
  end

  def create
  	@category = Category.new(params[:category])
  	if @category.save 
  		redirect_to categories_path
  	else 
  		render :new
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
  	redirect_to categories_path
  end

	private
	  def find_category
	  	@category = Category.find_by_id(params[:id])
	  end
end