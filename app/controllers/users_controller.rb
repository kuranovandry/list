class UsersController < ApplicationController
	before_filter :find_user, only: [:update, :destroy, :edit, :show]
  skip_before_filter :login?

	def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save 
  		redirect_to new_login_path
  	else 
  		render :new
  	end
  end

  def destroy
  	@user.destroy
  	redirect_to users_path
  end

  def update
    #binding.pry
    respond_to do |format|
      format.js do
        if @user.update_attributes(params[:user])
          @users = User.all
          render :update, layout: false
        else
          render :create, layout: false
        end
      end
    	format.html do 
        if @user.update_attributes(params[:user])
    		  redirect_to categories_path
        else
          render :edit
      	end
      end
    end
  end

  def edit
    respond_to do |format|
      format.js { render :create, layout: false }
      format.html
    end
  end

  private
	  def find_user
	  	@user = User.find_by_id(params[:id])
	  end
end