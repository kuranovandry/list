class LoginController < ApplicationController

	skip_before_filter :login?

  def new
    session[:user_id] = nil
  end

  def create
  	@user = User.find_by_email(params[:email])
  	if @user 
  		if @user.password == params[:password]
  			session[:user_id] = @user.id
  			redirect_to categories_path
  		else
  			render :new
  		end
  	else
  		render :new
  	end
  end

  def destroy
    session[:user_id] = nil
  	redirect_to new_login_path
  end
end