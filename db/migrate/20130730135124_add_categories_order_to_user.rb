class AddCategoriesOrderToUser < ActiveRecord::Migration
  def change
    add_column :users, :categories_order, :string, default: []
  end
end
