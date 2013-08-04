class CategoriesOrdersController < ApplicationController
	def index
		#binding.pry
		current_user.update_attribute(:categories_order, params[:category])
		render nothing: true
  end
end